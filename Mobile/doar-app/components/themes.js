import { DefaultTheme as NavigationDefaultTheme } from '@react-navigation/native';
import { DefaultTheme as PaperDefaultTheme } from 'react-native-paper';
import Colors from '../styles'

export default {
    ...PaperDefaultTheme,
    ...NavigationDefaultTheme,
    colors: {
      ...PaperDefaultTheme.colors,
      ...NavigationDefaultTheme.colors,
      primary: Colors.primary,
      accent: Colors.accent,
      background: Colors.background,
    },
};