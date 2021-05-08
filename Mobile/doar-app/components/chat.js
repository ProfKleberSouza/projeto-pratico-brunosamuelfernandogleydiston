import React from 'react';
import { Text, View, StyleSheet } from 'react-native';
import { TextInput, Button } from 'react-native-paper';

import Colors from '../styles'

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
                    onClick={() => { console.log() }} />
            </View>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        display: 'flex',
        justifyContent: "center",
        alignItems: "center"
    },
    textStyle: {
        backgroundColor: 'black',
        fontSize: 20,
        color: 'white'
    },
    messageContainer: {
        flex: 1,
        position: 'fixed',
        bottom: 0,
        width: '100%',
        margin: 3,
        flexDirection: 'row'

    },
    messageInput: {
        alignSelf: 'stretch',
        width: '78%',
    },
    sendButton: {
        height: '100%',
        margin: 5,
        width: '18%',
    },

})

export default Chat;