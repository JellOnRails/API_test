
TYPE_LIST = {
    'String' => String,
    'Integer' => Fixnum
}

def get_type( type )
  @type_list[ type ]
end

def set_type( value, type )
  type == 'Integer' ? value.to_i : value
end