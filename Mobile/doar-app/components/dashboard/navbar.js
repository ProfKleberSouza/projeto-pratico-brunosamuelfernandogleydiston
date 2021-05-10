import React from 'react';
import { Text, IconButton } from 'react-native-paper';
import { View } from 'react-native';
import { styles } from './styles';
import firebase from '../../database/firebase';
import { useNavigation } from '@react-navigation/native';

export default function DashBardNavBar(props) {
    const navigation = useNavigation();

    function signOut() {
        firebase.auth().signOut().then(() => {
            console.log('logout successfully')
            navigation.navigate('Login')
        })
            .catch(error => console.log('erro:', error.message))
    }
    return (
        <View style={{
            display: 'flex',
            flexDirection: 'row',
            justifyContent: 'space-between',
            alignItems: 'center'
        }}>

            <View>
                <Text style={styles.navTitle}>Doações</Text>
            </View>
            <View style={{ justifyContent: 'flex-end' }}>
                <View style={{
                    display: 'flex',
                    flexDirection: 'row',
                    alignItems: 'center'
                }}>
                    <IconButton
                        icon='clipboard-plus'
                        onPress={() => console.log('add new donation')}
                    />
                    <IconButton
                        icon='account-edit'
                        onPress={() =>
                            navigation.navigate('Profile')}
                    />
                    <IconButton
                        icon='logout'
                        onPress={() => signOut()}
                    />
                </View>
            </View>
        </View>
    );
}