import React, { useState } from 'react';
import { Button, View } from 'react-native';
import { TextInput, RadioButton, Text } from 'react-native-paper';
import { styles } from './styles';
import firebase from '../../database/firebase';

export default function editDonation({ route }) {

    const types = [{ key: 1, item: "food" }, { key: 2, item: "wallet-giftcard" }, { key: 3, item: "medical-bag" }]

    const { key, title, desc, user, don, img, type, del } = route.params;

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
    if (firebase.auth().currentUser.uid == user) {
        return (
            <View>
                <View>
                    <TextInput
                        mode='flat'
                        style={styles.userEdit}
                        label='Título'
                        value={data.title}
                        onChangeText={(val) => setData({ ...data, title: val })}>
                    </TextInput>
                </View>
                <View>
                    <TextInput
                        mode='flat'
                        style={styles.userEdit}
                        label='Título'
                        value={data.desc}
                        onChangeText={(val) => setData({ ...data, desc: val })}>
                    </TextInput>
                </View>
                <View style={styles.chip}>
                    <RadioButton.Group onValueChange={(val) => setData({ ...data, type: val })} value={data.type}     >
                        {types.map(v =>
                            <RadioButton.Item key={v.key} label={v.item} value={v.item} />

                        )}
                    </RadioButton.Group>
                </View>
                <Button mode='contained'
                    uppercase={false}
                    style={styles.button}
                    labelStyle={{ color: '#ffffff', fontSize: 16, fontWeight: '600', }}
                >
                    Salvar
            </Button>
            </View>
        )
    } else {
        return (
            <View>
                <Text>current: {firebase.auth().currentUser.uid}
                    dado.user: {data.user}</Text>
            </View>
        )
    }


}

