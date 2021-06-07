import React from 'react';
import { View } from 'react-native';
import { Button, Text, TextInput, RadioButton } from 'react-native-paper';
import { styles } from './styles';
import firebase from '../../database/firebase';
import mock_data from '../list/index'
import { useNavigation } from '@react-navigation/native';
import { editDonation, insert } from '../../controller';
import uniqid from 'uniqid'

export default function Donation() {

    const translate = {
        'Alimento':'food',
        'Presente': 'wallet-giftcard',
        'Remédio': 'medical-bag' 
    }
    const navigation = useNavigation();
    const [title, setTitle] = React.useState('');
    const [desc, setDesc] = React.useState('');
    const type = [{ key: 1, item: "Alimento" }, { key: 2, item: "Presente" }, { key: 3, item: "Remédio" }]
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
                        <RadioButton.Item key={v.key} label={v.item} value={v.item} />

                    )}
                </RadioButton.Group>
            </View>
            <View>
                <Button icon="plus-circle" mode="contained" onPress={() => {
                    setDonation(title, desc, typeSelected);
                    alert("done");
                }}>
                    Adicionar
                </Button>
            </View>
        </View>
    );

    function setDonation(title, desc, type) {
        if (!title) {
            return;
        }
        let donation = {
            user: firebase.auth().currentUser?.uid,
            title: title,
            desc: desc,
            type: translate[type], 
            id: uniqid(),
            img: 'https://picsum.photos/700',
            createdAt: new Date(),
            done: false,
            del: false,
        };
        editDonation(donation).then(()=>{
            setDesc('');
            setTitle('');
            setValue('Alimento');
        });
    }
}

