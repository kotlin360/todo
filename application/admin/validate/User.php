<?php

namespace app\admin\validate;

use think\Validate;

class User extends Validate
{
    protected $rule = [
        ['username', 'unique:admin', '管理员已经存在']
    ];

}