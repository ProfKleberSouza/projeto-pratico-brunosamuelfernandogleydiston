import { StyleSheet } from 'react-native';
import Colors from '../../styles'

export const styles = StyleSheet.create({
    text: {
        color: Colors.secondary,
        marginLeft: 15,
        textAlign: 'left',
        fontSize: 35,
    },
    aboutContainer: {
        padding: 20
    },
    header: {
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        backgroundColor: 'white',
        paddingTop: 20,
        paddingLeft: 20,
        shadowColor: '#000',
        shadowOffset: { width: 0, height: 2 },
        shadowOpacity: 0.1,
        shadowRadius: 2,
    },
    menuButton: {
        flex: 4,
        justifyContent: 'flex-end'
    },
    button: {
        color: '#63dadb',
        margin: 20,
        marginTop: 100,
    }
});
