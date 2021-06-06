import React from 'react';
import renderer from 'react-test-renderer';


import Signup from '../components/signup';
jest.useFakeTimers()



describe('Renderização signup', () => {
    it('deve conter 6 filhos', () => {
        const tree = renderer.create(<Signup />).toJSON();
        expect(tree.children.length).toBe(6);
    });
});