import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
    container: {
        display: 'flex',
        flexDirection: 'column',
        padding: 35,
        paddingTop: 0,
        backgroundColor: '#ffffff',
    },
    preloader: {
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        position: 'absolute',
        alignItems: 'center',
        justifyContent: 'center',
    },
    logoStyle: {
        marginTop: 50,
        marginBottom: 25,
        width: 150,
        height: 150,
        resizeMode: 'contain',
    },
    title: {
        marginBottom: 10,
        fontSize: 22,
        fontWeight: '200',
    },
    subtitle: {
        fontSize: 12,
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