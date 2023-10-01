//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo(_text, false));
    }

    function get(uint256 _index)
        public
        view
        returns (string memory text, bool completed)
    {
        //memory - 29480 gas
        //storage - 29397 gas
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function update(uint256 _index, string calldata _text) external {
        // method 1 - uses less gas if single variable is updated
        todos[_index].text = _text;
    }

    function toggleCompleted(uint256 _index) external {
        //method 2 - uses less gas if multiple fields are updated
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
