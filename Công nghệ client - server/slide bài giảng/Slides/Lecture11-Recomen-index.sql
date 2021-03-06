use [AdventureWorks]
go

CREATE NONCLUSTERED INDEX [_dta_index_Contact_9_309576141__K6_K10_1_2_3_4_5_7_8_9_11_12_13_14_15] ON [Person].[Contact] 
(
	[LastName] ASC,
	[Phone] ASC
)
INCLUDE ( [ContactID],
[NameStyle],
[Title],
[FirstName],
[MiddleName],
[Suffix],
[EmailAddress],
[EmailPromotion],
[PasswordHash],
[PasswordSalt],
[AdditionalContactInfo],
[rowguid],
[ModifiedDate]) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
go

CREATE STATISTICS [_dta_stat_309576141_10_6] ON [Person].[Contact]([Phone], [LastName])
go

