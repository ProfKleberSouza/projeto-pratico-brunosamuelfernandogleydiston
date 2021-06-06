import React from 'react';
import renderer from 'react-test-renderer';


import Profile from '../components/profile';
jest.useFakeTimers()



describe('Renderização Perfil', () => {
    it('deve conter 3 filhos', () => {
        const tree = renderer.create(<Profile />).toJSON();
        expect(tree.children.length).toBe(3);
    });
});