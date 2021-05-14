import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
    container: {
        flex: 1,
        display: 'flex',
        flexDirection: 'column',
        padding: 35,
        backgroundColor: '#fff'
    },
    inputStyle: {
        width: '100%',
        marginBottom: 15,
        paddingBottom: 15,
        alignSelf: 'center',
        borderColor: '#ccc',
        borderBottomWidth: 1
    },
    loginText: {
        color: '#3740FE',
        marginTop: 25,
        textAlign: 'center'
    },
    preloader: {
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        position: 'absolute',
        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: '#fff'
    },
    title: {
        marginTop: 25,
        marginBottom: 25,
        fontSize: 22,
        fontWeight: '200',
    },
    inputText: {
        width: '100%',
        alignSelf: 'center',
        textAlign: 'left',
        backgroundColor: '#ffffff',
    },
    button: {
        color: '#63dadb',
        marginTop: 30,
    },
    loginText: {
        marginTop: 30,
        textAlign: 'center',
    },
});