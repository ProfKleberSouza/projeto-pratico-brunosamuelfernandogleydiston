import { DefaultTheme as NavigationDefaultTheme } from '@react-navigation/native';
import { DefaultTheme as PaperDefaultTheme } from 'react-native-paper';

export default customTheme= {
    ...PaperDefaultTheme,
    ...NavigationDefaultTheme,
    colors: {
      ...PaperDefaultTheme.colors,
      ...NavigationDefaultTheme.colors,
      primary: '#63dadb',
      accent: '#2f2d2a',
      background: '#fff',
      backdrop: '#fff',
      titleColor: '#44444C',
    },
  };