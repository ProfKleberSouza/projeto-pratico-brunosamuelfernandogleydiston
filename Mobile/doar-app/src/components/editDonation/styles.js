import { StyleSheet } from 'react-native';
import Colors from '../../styles'

export const styles = StyleSheet.create({
    header: {
        backgroundColor: '#63dadb',
        height: 100,
    },
    avatar: {
        width: 130,
        height: 130,
        borderRadius: 63,
        borderWidth: 4,
        borderColor: "white",
        marginBottom: 10,
        alignSelf: 'center',
        position: 'absolute',
        marginTop: 30
    },
    body: {
        marginTop: 40,
    },
    bodyContent: {
        flex: 1,
        alignItems: 'left',
        padding: 30,
    },
    userName: {
        fontSize: 22,
        color: "#696969",
        fontWeight: "600",
        textAlign: 'center'
    },
    userInfo: {
        fontSize: 16,
        color: '#747474',
        marginTop: 10,
        textAlign: 'left'
    },
    userDescription: {
        fontSize: 16,
        color: "#696969",
        marginTop: 10,
        textAlign: 'justify'
    },
    button: {
        color: '#63dadb',
        margin: 20,
        marginTop: 100,
        alignSelf: 'center'
        
    },
    userEdit: {
        width: '100%',
        alignSelf: 'center',
        textAlign: 'left',
        backgroundColor: '#ffffff'
    }
});