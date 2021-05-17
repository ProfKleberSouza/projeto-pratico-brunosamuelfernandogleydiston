import React from 'react';
import { View } from 'react-native';
import { Button, Text, TextInput } from 'react-native-paper';
import { styles } from './styles';
import firebase from '../../database/firebase';
import mock_data from '../list/index'
import { useNavigation } from '@react-navigation/native';
import { RadioButton } from 'react-native-paper';
import { insert } from '../../controller';

export default function Donation() {

    const navigation = useNavigation();
    const [title, setTitle] = React.useState('');
    const [desc, setDesc] = React.useState('');
    const type = [{ key: 1, item: "food" }, { key: 2, item: "wallet-giftcard" }, { key: 3, item: "medical-bag" }]
    let [typeSelected, setValue] = React.useState('food');

    return (
        <View style={styles.body}>
            <View>
                <Text>Digite um título para sua doação:</Text>
                <TextInput
                    mode='outlined'
                    label="Título"
                    value={title}
                    onChangeText={text => setTitle(text)}
                />
            </View>
            <View>
                <Text rkType='primary3 mediumLine' >Escreva um pouco sobre sua doação:</Text>
                <TextInput
                    mode='outlined'
                    label="Descrição"
                    value={desc}
                    onChangeText={desc => setDesc(desc)}
                />
            </View>
            <View style={styles.chip}>
                <Text>De qual tipo sua doação se encaixa?</Text>
                <RadioButton.Group onValueChange={typeSelected => setValue(typeSelected)} value={typeSelected}     >
                    {type.map(v =>
                    <RadioButton.Item key={v.key} label={ v.item } value={v.item} />

                    )}
                </RadioButton.Group>
            </View>
            <View>
                <Button icon="plus-circle" mode="contained" onPress={() => setDonation(title, desc, typeSelected)}>
                    Adicionar
                </Button>
            </View>
        </View>
    );

    function setDonation(title, desc, type) {
        if (!title) {
            return;
        }
        let data = mock_data;
    
        let donation = {
            user: firebase.auth().currentUser?.uid,
            title: title,
            desc: desc,
            type: type
        };
        //Você parou daqui toninho push.(donate);
        insert('donations', donation, ()=>{
            console.log('done')
            setTitle('');
            setDesc('');
            //limpar input
            });
        //mock_data.push(donation);
    }
}

