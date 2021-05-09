import React from 'react';
import { Text, View } from 'react-native';
import { TextInput, Button } from 'react-native-paper';

import { styles } from './styles';
import Colors from '../../styles'

const Chat = () => {

    const [text, setText] = React.useState('');
    return (
        <View style={styles.container}>
            <Text style={styles.textStyle}>
                TO-DO🎉
      </Text>
            <View style={styles.messageContainer}>
                <TextInput
                    style={styles.messageInput}
                    mode='outlined'
                    multiline='true'
                    placeholder="Digite uma mensagem"
                    value={text}
                    onChangeText={text => setText(text)}
                    onKeyPress={key => console.log(key)}
                />
                <Button icon='send' 
                    style={[styles.sendButton,
                    { backgroundColor: Colors.background }]}
                    onPress={() => { console.log() }} />
            </View>
        </View>
    );
}


export default Chat;