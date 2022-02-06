
CREATE DEFINER=`root`@`localhost` PROCEDURE `update`(
	in varNazivDrzave varchar(50),
    in varIdOsobe integer,
    in varIme varchar(30),
    in varPrezime varchar(30),
    in varDatumRodjenja date,
    in varMjestoRodjenja varchar(50),
    in varPozicija varchar(30),
    in varVisina integer,
    in varTezina integer,
    in varCijena decimal,
    in varNoga varchar(20),
	in varBroj integer,
    in varNatpis varchar(30),
    in varNazivKluba varchar(100),
	out rezultat varchar(30)
)
BEGIN
	declare a int default 0;
    declare b int default 0;
    declare c int default 0;
	declare d int default 0;
    declare i int default 0;
    declare e int default 0;
	select idDrzavljanstva into a from drzavljanstvo where NazivDrzave=varNazivDrzave;
    update osoba set Ime=varIme, Prezime=varPrezime, DatumRodjenja=varDatumRodjenja, 
		MjestoRodjenja=varMjestoRodjenja, DRZAVLJANSTVO_idDrzavljanstva = a 
        where idOsobe = varIdOsobe;
	update igrac set Pozicija=varPozicija, Visina=varVisina, Tezina=varTezina, Cijena=varCijena,
    Noga=varNoga where OSOBA_idOsobe=varIdOsobe;
    select idKluba into c from klub where NazivKluba = varNazivKluba;
    /*select KLUB_idKluba into b from dres where KLUB_idKluba = c;*/
    select Broj into d from dres where KLUB_idKluba=c and Broj=varBroj;
    select Broj into i  from dres where IGRAC_OSOBA_idOsobe=varIdOsobe;
    select KLUB_idKluba into e  from dres where IGRAC_OSOBA_idOsobe=varIdOsobe;
    update dres set  Natpis=varNatpis
			where IGRAC_OSOBA_idOsobe=varIdOsobe;
	if d = 0 then
		update dres set Broj=varBroj, KLUB_idKluba = c
			where IGRAC_OSOBA_idOsobe=varIdOsobe;
	/*i=d ako je novi broj jednak starom broju, c=e ako je novi klub jednak starom 
    onda se nista ne desava*/
	elseif i = d and c = e then set rezultat = "";
	else set rezultat = "postoji broj";
	end if;
END





CREATE DEFINER=`root`@`localhost` PROCEDURE `insert`(
	in varNazivDrzave varchar(50),
    in varIme varchar(30),
    in varPrezime varchar(30),
    in varDatumRodjenja date,
    in varMjestoRodjenja varchar(50),
    in varPozicija varchar(30),
    in varVisina integer,
    in varTezina integer,
    in varCijena decimal,
    in varNoga varchar(20),
	in varBroj integer,
    in varNatpis varchar(30),
    in varNazivKluba varchar(100)
)
BEGIN
	declare a int default 0;
    declare b int default 0;
    declare c int default 0;
	select idDrzavljanstva into a  from drzavljanstvo where NazivDrzave=varNazivDrzave;
	insert into osoba(Ime,Prezime,DatumRodjenja,MjestoRodjenja,DRZAVLJANSTVO_idDrzavljanstva)
		value(varIme,varPrezime,varDatumRodjenja,varMjestoRodjenja,a);
	set b = LAST_INSERT_ID();
    insert into igrac(Pozicija,Visina,Tezina,Cijena,Noga,OSOBA_idOsobe)
		value(varPozicija,varVisina,varTezina,varCijena,varNoga,b);
	select idKluba into c from klub where NazivKluba = varNazivKluba;
	insert into dres(Broj,Natpis,KLUB_idKluba,IGRAC_OSOBA_idOsobe)
		value(varBroj,varNatpis,c,b);
END






CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `select_all_transfers` AS
    SELECT 
        `t`.`Cijena` AS `Cijena`,
        `t`.`DatumTransfera` AS `DatumTransfera`,
        `o`.`Ime` AS `Ime`,
        `o`.`Prezime` AS `Prezime`,
        `k1`.`NazivKluba` AS `KlubIz`,
        `k2`.`NazivKluba` AS `KlubU`
    FROM
        (((`transfer` `t`
        JOIN `osoba` `o` ON ((`o`.`idOsobe` = `t`.`OSOBA_idOsobe`)))
        JOIN `klub` `k1` ON ((`k1`.`idKluba` = `t`.`KLUB_idKluba1`)))
        JOIN `klub` `k2` ON ((`k2`.`idKluba` = `t`.`KLUB_idKluba2`)))
		



CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `select_all` AS
    SELECT 
        `i`.`Pozicija` AS `Pozicija`,
        `i`.`Visina` AS `Visina`,
        `i`.`Tezina` AS `Tezina`,
        `i`.`Cijena` AS `Cijena`,
        `i`.`Noga` AS `Noga`,
        `o`.`Ime` AS `Ime`,
        `o`.`Prezime` AS `Prezime`,
        `o`.`DatumRodjenja` AS `DatumRodjenja`,
        `o`.`MjestoRodjenja` AS `MjestoRodjenja`,
        `d`.`NazivDrzave` AS `NazivDrzave`,
        `r`.`Broj` AS `Broj`,
        `r`.`Natpis` AS `Natpis`,
        `k`.`NazivKluba` AS `NazivKluba`
    FROM
        ((((`igrac` `i`
        JOIN `osoba` `o` ON ((`i`.`OSOBA_idOsobe` = `o`.`idOsobe`)))
        JOIN `drzavljanstvo` `d` ON ((`d`.`idDrzavljanstva` = `o`.`DRZAVLJANSTVO_idDrzavljanstva`)))
        JOIN `dres` `r` ON ((`i`.`OSOBA_idOsobe` = `r`.`IGRAC_OSOBA_idOsobe`)))
        JOIN `klub` `k` ON ((`k`.`idKluba` = `r`.`KLUB_idKluba`)))	




CREATE DEFINER=`root`@`localhost` TRIGGER `transfer_AFTER_INSERT` AFTER INSERT ON `transfer` FOR EACH ROW BEGIN
	update dres set KLUB_idKluba = new.KLUB_idKluba2 where IGRAC_OSOBA_idOsobe = new.OSOBA_idOsobe;
END