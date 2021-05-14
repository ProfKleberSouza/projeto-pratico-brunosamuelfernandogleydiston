import React, { useState } from 'react';
import { FlatList, View } from 'react-native';
import { Avatar, Button, Text, TextInput, Chip } from 'react-native-paper';
import { styles } from './styles';
import firebase from '../../database/firebase';
import mock_data from '../list/index'
import { SafeAreaView } from  'react-native';

export default function Donation(){
      
    const [title, setTitle] = React.useState('');
    const [desc, setDesc] = React.useState('');
    const type = [{id: 1, item: "food"}, {id: 2, item: "wallet-giftcard"}, {id: 3, item: "medical-bag"}]

    return (
        <View>
            <View>
                <TextInput
                label="Título"
                value={title}
                onChangeText={text => setTitle(text)}
                />
            </View>
            <View>
                <TextInput
                label="Descrição"
                value={desc}
                onChangeText={desc => setDesc(desc)}
                />
            </View>
            <View style={styles.chip}>
                {type.map(v=>
        
                    <Chip style={styles.chip} icon="information" onPress={() => {
                        const typeSelected = v;
                        console.log(`id: ${v.id}, item: ${v.item}`)
                    }}>{v.item}</Chip>
                    )}
            </View>
            <View>
                <Button icon="plus-circle" mode="contained" onPress={() => setDonation(title,desc, typeSelected)}>
                    Adicionar
                </Button>
                <Button icon="plus-circle" mode="contained" onPress={() => navigation.navigate('Donation')}>
                    Cancelar
                </Button>
            </View>
        </View>
    );
}

function setDonation(title, desc, type){
    let key = 1;
    key = mock_data.map(v=>key++);
    const name = firebase.auth().currentUser.displayName;
    const img = require("../../assets/images/avatar.png");

    const donation = {
        key: key,
        title: title,
        desc: desc,
        user: name,
        don: false,
        img: img,
        type: type
    };
//Você parou daqui toninho
    console.log(donation);
    //mock_data.push(donation);
}