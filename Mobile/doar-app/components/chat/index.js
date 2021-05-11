import React, { Component } from 'react';
import {
  Text,
  View,
  TouchableOpacity,
  Image,
  TextInput,
  FlatList,
  ScrollView,
  SafeAreaView
} from 'react-native';
import { IconButton } from 'react-native-paper';

import { styles } from './styles';


const mock_data = [
  { id: 1, date: "9:50 am", type: 'in', message: "Lorem ipsum dolor sit amet" },
  { id: 2, date: "9:50 am", type: 'out', message: "Lorem ipsum dolor sit amet" },
  { id: 3, date: "9:50 am", type: 'in', message: "Lorem ipsum dolor sit a met" },
  { id: 4, date: "9:50 am", type: 'in', message: "Lorem ipsum dolor sit a met" },
  { id: 5, date: "9:50 am", type: 'out', message: "Lorem ipsum dolor sit a met" },
  { id: 6, date: "9:50 am", type: 'out', message: "Lorem ipsum dolor sit a met" },
  { id: 7, date: "9:50 am", type: 'in', message: "Lorem ipsum dolor sit a met" },
  { id: 8, date: "9:50 am", type: 'in', message: "Lorem ipsum dolor sit a met" },
  { id: 9, date: "9:50 am", type: 'in', message: "Lorem ipsum dolor sit a met" },
]

function renderDate(date) {
  return (
    <Text style={styles.time}>
      {date}
    </Text>
  );
}
export default function Chat() {

  const [text, setText] = React.useState('');
  return (
    <SafeAreaView style={styles.container}>

      <ScrollView style={{height: 40}}>

        <FlatList style={styles.list}
          data={mock_data}
          keyExtractor={(item) => item.id.toString()}
          renderItem={(message) => {
            const item = message.item;
            let inMessage = item.type === 'in';
            let itemStyle = inMessage ? styles.itemIn : styles.itemOut;
            return (
              <View style={[styles.item, itemStyle]}>
                {!inMessage && renderDate(item.date)}
                <View style={[styles.balloon]}>
                  <Text>{item.message}</Text>
                </View>
                {inMessage && renderDate(item.date)}
              </View>
            )
          }} />
      </ScrollView>
      <View style={styles.footer}>
        <View style={styles.inputContainer}>
          <TextInput style={styles.inputs}
            placeholder="Escreva uma Mensagem..."
            underlineColorAndroid='transparent'
            value={text}
            onChangeText={(text) => setText(text)} />
        </View>

        <TouchableOpacity style={styles.btnSend}>
          <IconButton icon='send' size={20} style={styles.iconSend} />
        </TouchableOpacity>
      </View>

    </SafeAreaView>
  );
}

