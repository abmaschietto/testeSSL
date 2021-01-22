package br.com.tdv.testeSSL.confs;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.cloud.netflix.ribbon.SpringClientFactory;
import org.springframework.cloud.openfeign.ribbon.CachingSpringLoadBalancerFactory;
import org.springframework.cloud.openfeign.ribbon.LoadBalancerFeignClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import feign.Client;


@Configuration
public class CustomFeignConfiguration {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomFeignConfiguration.class);

  @Bean
  public Client getfeignClient(){
	  logger.info("passando por feign config");
      Client trustSSLSockets = new Client.Default(SSLUtil.getClientSSLSocketFactory(), null);
      return trustSSLSockets;
  }

  @Bean
  @ConditionalOnMissingBean
  public Client feignClient(CachingSpringLoadBalancerFactory cachingFactory,SpringClientFactory clientFactory) {
      return new LoadBalancerFeignClient(new Client.Default(null, null), cachingFactory, clientFactory);
  }

}