global class CandidatesSchedule implements schedulable {
    global void execute(schedulableContext sc){
        DeletScreenRejectedCandidates batch = new DeletScreenRejectedCandidates ();
        database.executeBatch(batch);
    }
}