package com.agritech;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;   // <-- add this import

@SpringBootTest
@ActiveProfiles("test")   // <-- add this line
class AgritechBackendApplicationTests {

    @Test
    void contextLoads() {
    }

}
