import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
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
    }
});
