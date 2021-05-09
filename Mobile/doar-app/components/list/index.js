
import React from 'react';
import { FlatList, View } from 'react-native';
import { Avatar, Text } from 'react-native-paper';
import { styles } from './styles';

const avatar = require("../../assets/images/avatar.png")
const mock_data = [
    { key: 1, desc: "Cesta básica", user: "Fernando", don: false, img: avatar, type: "Alimento" },
    { key: 2, desc: "Frauda geriátrica", user: "Tom", don: false, img: avatar, type: "Higiene" },
    { key: 3, desc: "PC gamer", user: "Bruno", don: false, img: avatar, type: "Acessório" },
    { key: 4, desc: "Abrigo temporário", user: "Samuel", don: false, img: avatar, type: "Auxílio direto" },
    { key: 5, desc: "Ajuda Psicológica", user: "Maria Joaquina", don: false, img: avatar, type: "Auxílio direto" },
    { key: 6, desc: "Frauda geriátrica", user: "Cirílo", don: false, img: avatar, type: "Higiene" },
]

export default function Lista() {

    function renderItem({item}) {
        return (
            <View style={styles.cell} onPress={() => console.log('Pressed')}>
                <Avatar.Image style={styles.title} size={40}
                    source={item.img} />
                <Text style={styles.title}>{item.user}</Text>
                <Text style={styles.cell}>{item.desc}</Text>
            </View>
        )
    }

    return (
        <View style={styles.container}>
            <FlatList style={styles.list}
                data={mock_data}
                renderItem={renderItem}
                keyExtractor={item => item.key.toString()}
            />
        </View>
    );

};



