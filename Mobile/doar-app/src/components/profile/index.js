import React, { useState, useEffect } from 'react';
import { Text, View, Image } from 'react-native';
import { TextInput, Button } from 'react-native-paper';
import { getUserProfile, insert, updateProfile } from '../../controller';
import { styles } from './styles';

export default function Profile() {

  const [isUpdate, setIsUpdate] = useState(true);
  const [profile, setProfile] = useState({
    photo: 'https://bootdey.com/img/Content/avatar/avatar2.png',
    firstName: '',
    lastName: '',
    email: '',
    city: '',
    stateUf: '',
    description: '',
    number: ''
  });

  const updateUser = () => {
    updateProfile(profile).then(setIsUpdate(true));
  }

  useEffect(() => {
    getUserProfile()
      .then(data => {
        delete data.userID;
        setProfile(data);
      })
  }, []);
  return isUpdate
    ? (
      <View style={styles.container}>
        <View style={styles.header}></View>
        <Image
          style={styles.avatar}
          source={{ uri: profile.photo }}
        />
        <View style={styles.body}>
          <View style={styles.bodyContent}>
            <Text
              style={styles.userName}>
              {profile.firstName}&nbsp;{profile.lastName}
            </Text>
            <Text
              style={styles.userDescription}>
              {profile.description}
            </Text>
            <Text
              style={styles.userInfo}>
              Email@mail.com
                    {profile.email}
            </Text>
            <Text
              style={styles.userInfo}>
              {profile.number}
            </Text>
            <Text
              style={styles.userInfo}>
              {profile.city}-{profile.stateUf}
            </Text>
            <Button
              mode='contained'
              uppercase={false}
              style={styles.button}
              labelStyle={{ color: '#ffffff', fontSize: 16, fontWeight: '600', }}
              onPress={() => setIsUpdate(false)}>
              Atualizar
                </Button>
          </View>
        </View>
      </View>
    ) : (
      <View style={styles.container}>
        <View style={styles.header}></View>
        <Image
          style={styles.avatar}
          source={{ uri: profile.photo }}
        />
        <View style={styles.body}>
          <View style={styles.bodyContent}>
            <TextInput
              mode='flat'
              style={styles.userEdit}
              label='Imagem URL'
              value={profile.photo}
              onChangeText={(val) => setProfile({ ...profile, photo: val })}>
            </TextInput>
            <TextInput
              mode='flat'
              style={styles.userEdit}
              label='Primeiro nome'
              value={profile.firstName}
              onChangeText={(val) => setProfile({ ...profile, firstName: val })}>
            </TextInput>
            <TextInput
              mode='flat'
              style={styles.userEdit}
              label='Último nome'
              value={profile.lastName}
              onChangeText={(val) => setProfile({ ...profile, lastName: val })}>
            </TextInput>
            <TextInput
              mode='flat'
              multiline='true'
              numberOfLines='4'
              style={styles.userEdit}
              label='Descrição'
              value={profile.description}
              onChangeText={(val) => setProfile({ ...profile, description: val })}>
            </TextInput>
            <TextInput
              mode='flat'
              style={styles.userEdit}
              label='E-mail'
              value={profile.email}
              onChangeText={(val) => setProfile({ ...profile, email: val })}>
            </TextInput>
            <TextInput
              mode='flat'
              style={styles.userEdit}
              label='Número de contato'
              value={profile.number}
              onChangeText={(val) => setProfile({ ...profile, number: val })}>
            </TextInput>
            <TextInput
              mode='flat'
              style={styles.userEdit}
              label='Cidade'
              value={profile.city}
              onChangeText={(val) => setProfile({ ...profile, city: val })}>
            </TextInput>
            <TextInput
              mode='flat'
              style={styles.userEdit}
              label='Estado'
              value={profile.stateUf}
              onChangeText={(val) => setProfile({ ...profile, stateUf: val })}>
            </TextInput>
            <Button
              mode='contained'
              uppercase={false}
              style={styles.button}
              labelStyle={{ color: '#ffffff', fontSize: 16, fontWeight: '600', }}
              onPress={updateUser}>
              Salvar
                  </Button>
          </View>
        </View>
      </View>
    )

}