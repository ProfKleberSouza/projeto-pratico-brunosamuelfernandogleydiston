import React, { useState } from 'react';
import { View, Text } from 'react-native';
import { Avatar, Button, Card, Title, Paragraph, TextInput, RadioButton, } from 'react-native-paper';
import { styles } from './styles';
import firebase from '../../database/firebase';
import { useNavigation } from '@react-navigation/native';


export default function editDonation({ route }) {


    const { createdAt, del, desc, done, id, img, key, title, type, user } = route.params;

    const navigation = useNavigation();

    const [data, setData] = useState({
        title: title,
        key: key,
        desc: desc,
        user:user,
        id: id
    });

    const [titleUpdate, setTitle] = React.useState(data.title);
    const [descUpdate, setDesc] = React.useState(data.desc);
    let [typeSelected, setValue] = React.useState(data.type);

    const types = [{ key: 1, item: "food" }, { key: 2, item: "wallet-giftcard" }, { key: 3, item: "medical-bag" }]

    const LeftContent = props => <Avatar.Icon {...props} icon={data.type} />

    if (false) {
        return (
            <Card>
                <Card.Title title={data.title} subtitle={data.user} left={LeftContent} />
                <Card.Content>
                    <Title>{data.title}</Title>
                    <Paragraph>{data.desc}</Paragraph>
                </Card.Content>
                <Card.Cover source={{ uri: data.img ?? 'https://picsum.photos/700' }} />
                <Card.Actions>
                    <Button onPress={() => navigation.navigate('Lista')}>Cancel</Button>
                    <Button onPress={() => navigation.navigate('Chat')}>Chat</Button>
                </Card.Actions>
            </Card>
        )
    } else {
        return (
            <View>
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
                    {types.map(v =>
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
    }


}

