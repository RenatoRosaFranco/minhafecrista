# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '\nStart Running Seeds \n'

Category.destroy_all
Category.create([
    {
        name: 'Biblia Sagrada',
        description: 'Categoria de estudos sobre a Biblia Sagrada',
        tags: 'minha fé crista minhafecrista biblia sagrada'
    },
    {
        name: 'Imitação de Cristo',
        description: 'Categoria de estudos sobre a imitação de cristo',
        tags: 'minha fé cristã minhafecrista imitação de cristo imitacao'
    },
    {
        name: 'Regra de São Bento',
        description: 'Categoria de estudo sobre a Regra de São Bento',
        tags: 'minha fé cistã minhafecrista Regra de São Bento RB RM'
    }
                ])

puts '\nFinished Running Seeds \n'