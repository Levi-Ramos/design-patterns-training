unit Subject;

interface

uses Observeru;

type
	ISubject = interface
    ['{96A77459-75AE-4D09-96D8-D93B86AC22D9}']
    procedure RegisterObserver(AObserver: IObserver);
    procedure RemoveObserver(AObserver: IObserver);
    procedure NotifyObervers;
  end;

implementation


end.
