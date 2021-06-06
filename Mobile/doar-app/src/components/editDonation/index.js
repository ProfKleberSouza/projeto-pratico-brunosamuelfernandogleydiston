import React, { useState } from 'react';
import { View, Text } from 'react-native';
import { Avatar, Button, Card, Title, Paragraph, TextInput, RadioButton } from 'react-native-paper';
import { styles } from './styles';
import firebase from '../../database/firebase';
import { useNavigation } from '@react-navigation/native';

export default function editDonation({ route }) {

    //const types = [{ key: 1, item: "food" }, { key: 2, item: "wallet-giftcard" }, { key: 3, item: "medical-bag" }]

    const { key, title, desc, user, don, img, type, del } = route.params;

    const navigation = useNavigation();

    let [data, setData] = useState({
        key: key,
        title: title,
        desc: desc,
        user: user,
        don: don,
        img: img,
        type: type,
        delete: del
    });

    let [typeSelected, setValue] = React.useState('food');
    const types = [{ key: 1, item: "food" }, { key: 2, item: "wallet-giftcard" }, { key: 3, item: "medical-bag" }]


    const LeftContent = props => <Avatar.Icon {...props} icon={data.type} />

    if (true || firebase.auth().currentUser.uid == user) {
        return (
            <Card>
                <Card.Title title={data.title} subtitle={data.user} left={LeftContent} />
                <Card.Content>
                    <Title>{data.title}</Title>
                    <Paragraph>{data.desc}</Paragraph>
                </Card.Content>
                <Card.Cover source={{ uri: 'https://picsum.photos/700' }} />
                <Card.Actions>
                    <Button onPress={() => navigation.navigate('Dashboard')}>Cancel</Button>
                    <Button onPress={() => navigation.navigate('Chat')}>Chat</Button>
                </Card.Actions>
            </Card>
        )
    } else {
        return (
            <View></View>
        )
    }


}

