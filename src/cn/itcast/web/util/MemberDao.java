package cn.itcast.web.util;

import java.util.List;

public interface MemberDao {
//ʡ���������Ĵ���
    
    /** *//**
     * ��ҳ��ѯ
     * @param hql ��ѯ������
     * @param offset ��ʼ��¼
     * @param length һ�β�ѯ������¼
     * @return
     */
    public List queryForPage(final String hql,final int offset,final int length);
    
    /** *//**
     * ��ѯ���м�¼��
     * @param hql ��ѯ������
     * @return �ܼ�¼��
     */
    public int getAllRowCount(String hql);

}


