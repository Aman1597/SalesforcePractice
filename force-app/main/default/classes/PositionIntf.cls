public interface PositionIntf {
    Id newPosition(String name, String description);
    boolean modifyPositionDescription(Id recId, String newDescription);
    boolean modifyPositionStartDate(Id recId, Date newDescription);
    boolean modifyPositionPriority(Id recId, String newPriority);
    boolean modifyPositionDepartment(Id recId, String newDepartment);
}