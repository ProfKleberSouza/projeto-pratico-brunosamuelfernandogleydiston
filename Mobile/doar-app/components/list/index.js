
import React from 'react';
import { FlatList, View, Image, TouchableOpacity, } from 'react-native';
import { Avatar, Text } from 'react-native-paper';
import { styles } from './styles';

const avatar = require("../../assets/images/avatar.png")
const description = `There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..`
const mock_data = [
    { key: 1, title: "Cesta básica", desc: description, user: "Fernando", don: false, img: avatar, type: "food" },
    { key: 2, title: "Frauda geriátrica", desc: description, user: "Tom", don: false, img: avatar, type: "wallet-giftcard" },
    { key: 3, title: "PC gamer", desc: description, user: "Bruno", don: false, img: avatar, type: "wallet-giftcard" },
    { key: 4, title: "Abrigo temporário", desc: description, user: "Samuel", don: false, img: avatar, type: "laptop" },
    { key: 5, title: "Ajuda Psicológica", desc: description, user: "Maria Joaquina", don: false, img: avatar, type: "medical-bag" },
    { key: 6, title: "Frauda geriátrica", desc: description, user: "Cirílo", don: false, img: avatar, type: "wallet-giftcard" },
]

export default function Lista() {

    function renderItem({ item }) {
        return (
            <View style={styles.container}>
                <TouchableOpacity onPress={() => { }}>
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
                data={mock_data}
                renderItem={renderItem}
                keyExtractor={item => item.key.toString()}
            />
        </View>
    );

};



