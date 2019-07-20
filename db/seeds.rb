# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(first_name: 'John',
                    last_name: 'Doe',
                    email: 'johndoe@example.com',
                    phone: '1234567890',
                    address: '123 Main St, Denver, CO, 80205',
                    organ_donor: true,
                    place_of_birth: 'Fresno,CA',
                    deceased: false)
user2 = User.create!(first_name: 'Jane',
                    last_name: 'Doe',
                    email: 'janedoe@example.com',
                    phone: '0987654321',
                    address: '321 Any St, Denver, CO, 80205',
                    organ_donor: false,
                    place_of_birth: 'Sacramento,CA',
                    maiden_name: 'Smith',
                    deceased: false)
user3 = User.create!(first_name: 'Jack',
                    last_name: 'Smith',
                    email: 'jacksmith@example.com',
                    phone: '3216547890',
                    address: '333 Lodo St, Denver, CO, 80205',
                    organ_donor: true,
                    place_of_birth: 'Anaheim,CA',
                    deceased: true)
switch1 = DeadMansSwitch.create!(length_of_time: 5.days.from_now,
                                user_id: user1.id)
switch2 = DeadMansSwitch.create!(length_of_time: 6.days.from_now,
                                user_id: user2.id)
switch3 = DeadMansSwitch.create!(length_of_time: 10.days.from_now,
                                user_id: user3.id)
employer1 = Employer.create!(employer_company: 'Colorado Rockies',
                            employer_contact: 'Bill Gates',
                            phone: '4443335555',
                            email: 'bill@cr.com',
                            employee_id: 'abc123',
                            user_id: user1.id)
employer3 = Employer.create!(employer_company: 'Denver Broncos',
                            employer_contact: 'Warren Buffett',
                            phone: '1112223333',
                            email: 'warren@buffett.com',
                            employee_id: 'a1b2c3',
                            user_id: user3.id)
accounts1 = FinancialAccount.create!(institution_name: 'USAA',
                                    account_number: '112233',
                                    user_id: user1.id)
accounts2 = FinancialAccount.create!(institution_name: 'US Bank',
                                    account_number: '334455',
                                    user_id: user2.id)
accounts3 = FinancialAccount.create!(institution_name: 'NFCU',
                                    account_number: '9876543',
                                    user_id: user2.id)
accounts4 = FinancialAccount.create!(institution_name: 'Wells Fargo',
                                    account_number: 'AA11BB22',
                                    user_id: user3.id)
accounts5 = FinancialAccount.create!(institution_name: 'TD Bank',
                                    account_number: '77885566',
                                    user_id: user3.id)
contact1 = Contact.create!(first_name: 'Alex',
                          last_name: 'Der',
                          email: 'alex@der.com',
                          phone: '1012223456',
                          role: 0,
                          user_id: user1.id)
contact2 = Contact.create!(first_name: 'Alex',
                          last_name: 'Dra',
                          email: 'alex_dra@example.com',
                          phone: '4445555555',
                          role: 1,
                          user_id: user1.id)
contact3 = Contact.create!(first_name: 'Mills',
                          last_name: 'Provosty',
                          email: 'mills@example.com',
                          phone: '9990001111',
                          role: 1,
                          user_id: user1.id)
contact4 = Contact.create!(first_name: 'Brennan',
                          last_name: 'Ayers',
                          email: 'brennan@example.com',
                          phone: '7778889900',
                          role: 0,
                          user_id: user2.id)
contact5 = Contact.create!(first_name: 'Aurie',
                          last_name: 'G',
                          email: 'a_g@example.com',
                          phone: '7778881234',
                          role: 1,
                          user_id: user2.id)
contact6 = Contact.create!(first_name: 'Martin',
                          last_name: 'Mercer',
                          email: 'martin@example.com',
                          phone: '1112227658',
                          role: 0,
                          user_id: user3.id)
contact7 = Contact.create!(first_name: 'Billy',
                          last_name: 'U',
                          email: 'billy@example.com',
                          phone: '1199228833',
                          role: 1,
                          user_id: user3.id)
contact8 = Contact.create!(first_name: 'James',
                          last_name: 'Cape',
                          email: 'jame@example.com',
                          phone: '98712376545',
                          role: 1,
                          user_id: user3.id)
funeral1 = Funeral.create!(burial_cremation: 0,
                          funeral_home_name: 'Shady Oaks',
                          funeral_home_phone: '6667778888',
                          funeral_home_address: '456 Cemetery Way, Las Vegas, NV, 77777',
                          type_of_service: 0,
                          coffin_or_urn_purchased: true,
                          package_purchased: true,
                          docs_or_contract_exist: true,
                          user_id: user1.id)
funeral2 = Funeral.create!(burial_cremation: 3,
                          funeral_home_name: 'Whispering Pines',
                          funeral_home_phone: '6788766788',
                          funeral_home_address: '123 Elm Street, Reno, NV, 77887',
                          type_of_service: 4,
                          coffin_or_urn_purchased: false,
                          package_purchased: false,
                          docs_or_contract_exist: false,
                          user_id: user2.id)
funeral1 = Funeral.create!(burial_cremation: 6,
                          funeral_home_name: 'Weeping Willows',
                          funeral_home_phone: '8886669999',
                          funeral_home_address: '456 Hearse Blvd, Henderson, NV, 77797',
                          type_of_service: 4,
                          coffin_or_urn_purchased: false,
                          package_purchased: false,
                          docs_or_contract_exist: false,
                          user_id: user3.id)
