
import React from 'react';
import { FlatList, View, Image, TouchableOpacity, } from 'react-native';
import { Avatar, Text, TextInput } from 'react-native-paper';
import { styles } from './styles';
import { useNavigation } from '@react-navigation/native';
import { useEffect } from 'react';
import { getAllDonations } from '../../controller';
import { useState } from 'react';


const avatar = require("../../assets/images/avatar.png")
const description = `There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..`
export const mock_data = [
    { key: 1, title: "Cesta básica", desc: description, user: "Fernando", don: false, img: avatar, type: "food" },
    { key: 2, title: "Frauda geriátrica", desc: description, user: "Tom", don: false, img: avatar, type: "wallet-giftcard" },
    { key: 3, title: "PC gamer", desc: description, user: "Bruno", don: false, img: avatar, type: "wallet-giftcard" },
    { key: 4, title: "Abrigo temporário", desc: description, user: "Samuel", don: false, img: avatar, type: "laptop" },
    { key: 5, title: "Ajuda Psicológica", desc: description, user: "Maria Joaquina", don: false, img: avatar, type: "medical-bag" },
    { key: 6, title: "Ajuda Psicológica", desc: description, user: "Maria Joaquina", don: false, img: avatar, type: "medical-bag" },
    { key: 7, title: "Frauda geriátrica", desc: description, user: "Cirílo", don: false, img: avatar, type: "wallet-giftcard" },
    { key: 8, title: "Ajuda Psicológica", desc: description, user: "Maria Joaquina", don: false, img: avatar, type: "medical-bag" },
    { key: 9, title: "Ajuda Psicológica", desc: description, user: "Maria Joaquina", don: false, img: avatar, type: "medical-bag" },
    { key: 10, title: "Ajuda Psicológica", desc: description, user: "Maria Joaquina", don: false, img: avatar, type: "medical-bag" },
    { key: 11, title: "Ajuda Psicológica", desc: description, user: "Maria Joaquina", don: false, img: avatar, type: "medical-bag" },
    { key: 12, title: "Ajuda Psicológica", desc: description, user: "Maria Joaquina", don: false, img: avatar, type: "medical-bag" },
    { key: 13, title: "Abrigo temporário", desc: description, user: "Samuel", don: false, img: avatar, type: "laptop" },

]



export default function Lista(props) {
    const [_donations, setDonations] = useState(mock_data);
    useEffect(()=>{
        getAllDonations().then((donations)=>{
            setDonations(donations);
        })
    }, []);
    const navigation = useNavigation();
    function renderItem({ item }) {
        return (
            <View style={styles.container} >
                <TouchableOpacity onPress={() => navigation.navigate('Chat') } >
                    <Avatar.Icon size={50} icon={item.type}/>
                </TouchableOpacity>
                <View style={styles.content}>
                    <View style={styles.contentHeader}>
                        <Text style={styles.name}>{item.title}</Text>
                        <Text style={styles.time}>{item.user}</Text>
                    </View>
                    <Text rkType='primary3 mediumLine'>{item.desc}</Text>
                </View>
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