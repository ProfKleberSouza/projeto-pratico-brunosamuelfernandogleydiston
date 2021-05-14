import { signOut } from '../../controller';

import React from 'react';
import { Text, IconButton } from 'react-native-paper';
import { View } from 'react-native';
import { styles } from './styles';
import { useNavigation } from '@react-navigation/native';

import { newDonation } from '../list';

export default function DashBardNavBar(props) {
    const navigation = useNavigation();

    const onSignOut = () => navigation.navigate('Login')

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
                        onPress={() => navigation.navigate('Donation')}
                    />
                    <IconButton
                        icon='account-edit'
                        onPress={() =>
                            navigation.navigate('Profile')}
                    />
                    <IconButton
                        icon='logout'
                        onPress={() => signOut(onSignOut)}
                    />
                </View>
            </View>
        </View>
    );
}