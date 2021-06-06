import React from 'react';
import renderer from 'react-test-renderer';


import Login from '../components/login';
jest.useFakeTimers()



describe('Renderização Login', () => {
    it('deve ter 1 filho', () => {
        const tree = renderer.create(<Login />).toJSON();
        expect(tree.children.length).toBe(1);
    });
});