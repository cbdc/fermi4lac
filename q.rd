<resource schema="fermi4lac">
  <meta name="title">Fourth Fermi LAC catalog</meta>
  <meta name="creationDate">2019-07-20T12:02:03</meta>
  <meta name="description">
  The Fermi fourth LAC catalog.
  </meta>
  <meta name="creator.name">Fermi collaboration</meta>

  <meta name="subject">Catalogs</meta>
  <meta name="subject">gamma-ray sources</meta>

  <meta name="coverage">
    <meta name="profile">AllSky ICRS</meta>
    <meta name="waveband">Gamma-ray</meta>
  </meta>

  <meta name="source">
    2019.inpress;
  </meta>

  <table id="main" onDisk="True" mixin="//scs#q3cindex" primary="Source_Name">
    <index columns="RA,Dec"/>

    <column name="Source_Name" type="text"
      ucd="meta.id;meta.main"
      tablehead="name" verbLevel="1"
      description="Designation"
      required="True"/>

    <column name="RA" type="double precision"
      unit="deg" ucd="pos.eq.ra;meta.main"
      tablehead="RA" verbLevel="1"
      description="Right ascension"
      required="True"/>

    <column name="Dec" type="double precision"
      unit="deg" ucd="pos.eq.dec;meta.main"
      tablehead="Dec" verbLevel="1"
      description="Declination"
      required="True"/>

    <column name="Flux1000" type="real"
      unit="ph cm-2 s-1" ucd="phot.flux;em.gamma.hard"
      tablehead="Photon flux" verbLevel="1"
      description="Photon flux between 1-100 GeV"
      required="True"/>

    <column name="Unc_Flux1000" type="real"
      unit="ph cm-2 s-1" ucd="stat.error;phot.flux;em.gamma.hard"
      tablehead="Photon flux Error " verbLevel="1"
      description="Photon flux error between 1-100 GeV"
      required="True"/>
      
    <column name="CLASS" type="text"
      ucd="src.class"
      tablehead="CLASS" verbLevel="1"
      description="Source classification"
      required="True"/>

    <column name="ASSOC1" type="text"
      ucd="meta.id.assoc"
      tablehead="ASSOC" verbLevel="1"
      description="Association source"
      required="True"/>

    <column name="RA_Count" type="double precision"
      unit="deg" ucd="pos.eq.ra"
      tablehead="RA_count" verbLevel="1"
      description="Right ascension"
      required="True"/>

    <column name="Dec_Count" type="double precision"
      unit="deg" ucd="pos.eq.dec"
      tablehead="Dec_count" verbLevel="1"
      description="Declination"
      required="True"/>
      
    <column name="Redshift" type="real"
      ucd="src.redshift"
      tablehead="Redshift" verbLevel="1"
      description="Redshift"
      required="True"/>
      
  </table>

  <data id="import">
    <sources>f4lac.fits</sources>

    <fitsTableGrammar/>

    <make table="main">
      <rowmaker idmaps="*"/>
    </make>
  </data>

  <service id="cone" allowed="scs.xml,form">
    <meta name="title">4LAC flux catalog</meta>
    <meta name="shortName">4lac cone</meta>
    <meta name="testQuery">
      <meta name="ra">20.02637</meta>
      <meta name="dec">21.98903</meta>
      <meta name="sr">1.0</meta>
    </meta>

    <dbCore queriedTable="main">
      <FEED source="//scs#coreDescs"/>
    </dbCore>

    <publish render="scs.xml" sets="local"/>
    <publish render="form" sets="local"/>
    <outputTable verbLevel="20"/>
  </service>

</resource>
