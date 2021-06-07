
import React from 'react';
import { FlatList, View, Image, TouchableOpacity, } from 'react-native';
import { Avatar, Text, TextInput, List } from 'react-native-paper';
import { styles } from './styles';
import { useNavigation } from '@react-navigation/native';
import { useEffect } from 'react';
import { getAllDonations } from '../../controller';
import { useState } from 'react';

export default function Lista(props) {
    const [_donations, setDonations] = useState([]);
    useEffect(() => {
        getAllDonations().then((donations) => {
            setDonations(donations);
        })
    }, []);
    const navigation = useNavigation();
    function renderItem({ item }) {
        return (
            <View style={styles.container} >
                <List.Item style={styles.listItem}
                    onPress={() =>  navigation.navigate('editDonation', item)}
                    title={item.title}
                    description={item.desc}
                    left={props => <Avatar.Icon {...props} icon={item.type} />}
                />
            </View>

        )
    }

    return (
        <View style={styles.container}>
            <FlatList style={styles.root}
                data={_donations}
                renderItem={renderItem}
                keyExtractor={item => item.key.toString()}
            />
        </View>
    );

};