unit Observeru;

interface

type
	IObserver = interface
    ['{298BAE1E-1A4A-40F7-8AC1-23E63510D457}']
    procedure Update(const AFloat, AHumidity, APressure: double);
  end;

implementation

end.
