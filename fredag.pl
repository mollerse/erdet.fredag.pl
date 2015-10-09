:- module(fredag, [fredag/0]).

fredag :-
  get_time(Stamp),
  stamp_date_time(Stamp, DateTime, 'local'),
  date_time_value('date', DateTime, Date),
  day_of_the_week(Date, 5).
