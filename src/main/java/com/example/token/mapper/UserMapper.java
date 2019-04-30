package com.example.token.mapper;

        import com.baomidou.mybatisplus.mapper.BaseMapper;
        import com.example.token.entity.User;
        import org.apache.ibatis.annotations.Mapper;
        import org.springframework.stereotype.Component;


@Mapper
@Component
public interface UserMapper extends BaseMapper<User> {
    User findApp_KeyById(Integer id);
}
