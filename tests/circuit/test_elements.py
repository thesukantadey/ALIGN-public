import pytest

from align.circuit import elements, core

@pytest.fixture
def library():
    return elements.Library()

def TEST_SUBCKT(library):
    assert 'TEST_SUBCKT' not in library
    subckt = core.SubCircuit('TEST_SUBCKT', 'pin1', 'pin2', library=library, param1=1, param2=1e-3, param3="0.1f", param4="hello")
    assert 'TEST_SUBCKT' in library
    assert library['TEST_SUBCKT'] is subckt
    with pytest.raises(AssertionError):
        inst = subckt('X1')
    with pytest.raises(AssertionError):
        inst = subckt('X1', 'net10')
    inst = subckt('X1', 'net10', 'net12')
    assert inst.name == 'X1'
    assert type(inst).__name__ == 'TEST_SUBCKT'
    assert inst.pins == {'pin1': 'net10', 'pin2': 'net12'}
    assert list(inst.parameters.keys()) == ['param1', 'param2', 'param3', 'param4']
    assert inst.parameters['param1'] == 1
    assert inst.parameters['param2'] - 1e-3 <= 1e-19 # safe floating point comparison
    assert inst.parameters['param3'] - 1e-16 <= 1e-19 # safe floating point comparison
    assert inst.parameters['param4'] == 'hello'
    with pytest.raises(AssertionError):
        inst = subckt('X1', 'net10', 'net12', garbage='')
    with pytest.raises(AssertionError):
        inst = subckt('X1', 'net10', 'net12', param1='invalid_number')
    inst = subckt('X1', 'net10', 'net12', param1=2, param3=1e-16)
    assert inst.parameters['param1'] == 2
    assert inst.parameters['param3'] - 1e-16 <= 1e-19 # safe floating point comparison

def test_NMOS(library):
    assert 'NMOS' in library
    assert library['NMOS'] is elements.NMOS
    with pytest.raises(AssertionError):
        inst = elements.NMOS('M1', 'net10', 'net12', 'net13')
    with pytest.raises(AssertionError):
        inst = elements.NMOS('X1', 'net10', 'net12', 'net13', 'vss')
    inst = elements.NMOS('M1', 'net10', 'net12', 'net13', 'vss')
    assert inst.name == 'M1'
    assert type(inst).__name__ == 'NMOS'
    assert inst.pins == {'D': 'net10', 'G': 'net12', 'S': 'net13', 'B': 'vss'}
    assert list(inst.parameters.keys()) == ['W', 'L', 'NFIN']
    assert inst.parameters['W'] == 0
    assert inst.parameters['L'] == 0
    assert inst.parameters['NFIN'] == 1
    inst = elements.NMOS('M1', 'net10', 'net12', 'net13', 'vss', NFIN = 2)
    assert inst.parameters['NFIN'] == 2

def test_PMOS(library):
    assert 'PMOS' in library
    assert library['PMOS'] is elements.PMOS
    with pytest.raises(AssertionError):
        inst = elements.PMOS('M1', 'net10', 'net12', 'net13')
    with pytest.raises(AssertionError):
        inst = elements.PMOS('X1', 'net10', 'net12', 'net13', 'vss')
    inst = elements.PMOS('M1', 'net10', 'net12', 'net13', 'vss')
    assert inst.name == 'M1'
    assert type(inst).__name__ == 'PMOS'
    assert inst.pins == {'D': 'net10', 'G': 'net12', 'S': 'net13', 'B': 'vss'}
    assert list(inst.parameters.keys()) == ['W', 'L', 'NFIN']
    assert inst.parameters['W'] == 0
    assert inst.parameters['L'] == 0
    assert inst.parameters['NFIN'] == 1
    inst = elements.PMOS('M1', 'net10', 'net12', 'net13', 'vss', NFIN = 2)
    assert inst.parameters['NFIN'] == 2

def test_res(library):
    assert elements.RES.__name__ in library
    assert library[elements.RES.__name__] is elements.RES
    assert elements.RES in library.values()
    with pytest.raises(AssertionError):
        inst = elements.RES('R1', 'net10')
    with pytest.raises(AssertionError):
        inst = elements.RES('X1', 'net10', 'net12', 1.3)
    inst = elements.RES('R1', 'net10', 'net12', VALUE=1.3)
    assert inst.name == 'R1'
    assert type(inst).__name__ == 'RES'
    assert inst.pins == {'+': 'net10', '-': 'net12'}
    assert inst.parameters['VALUE'] == 1.3

def test_cap(library):
    assert elements.CAP.__name__ in library
    assert elements.CAP in library.values()
    with pytest.raises(AssertionError):
        inst = elements.CAP('C1', 'net10')
    with pytest.raises(AssertionError):
        inst = elements.CAP('X1', 'net10', 'net12', 1.3)
    inst = elements.CAP('C1', 'net10', 'net12', VALUE=1.3)
    assert inst.name == 'C1'
    assert type(inst).__name__ == 'CAP'
    assert inst.pins == {'+': 'net10', '-': 'net12'}
    assert inst.parameters['VALUE'] == 1.3
