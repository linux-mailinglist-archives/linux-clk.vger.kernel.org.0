Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D665700CEB
	for <lists+linux-clk@lfdr.de>; Fri, 12 May 2023 18:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbjELQZF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 12 May 2023 12:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjELQZE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 12:25:04 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A7A46A5
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 09:25:03 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-4360e73d0d4so3542200137.1
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683908703; x=1686500703;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=hedvTSKTehchw+3YCIzv/jI6Qg7WJgnGHvdO82fj4TjGHwkemI/DDMUemjMmHjVVnL
         KNhL2F2gyTQBlbhtJJob0QsVrl1msWK13Di8QwDNJSkxiuSLx5bxHW/NMEzssBmXnUaF
         N+haInF4OX7KBaQpc7DAvLxi3T0jw5mB2pdlvs+7+f5UY514zAwD46Wbii4HZvSUYdId
         RCCDa7WK2M4Y9wbNNaB49asPKcc8rd0MYukNz2WDPafVJEtJBTn8IM+1uTSnFl2k//NV
         b9iD1lS6OMcBZN2o8CWkswVjn7NfRl+j3wYPQPYIzR5qgc9H8B+eJZUbgyiEs9lROPHh
         43tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683908703; x=1686500703;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=go9qo0V8PyGmPIWe0iFnG2Q25HHRvAHeCmVqnsd92jaTGNgKMgMPrYcpurAb3igiYa
         F72xaFUsE0SY12YGB0HV0mxpz2yfs9lDqeSO3Kraj+2hfwAsU5w1PrgLMy63zpso0yMI
         dwo4keFpsULQ7INhavAs6W7EpOT8Ev7P4KoXx9PfqcMC2idBVeXFW72KOmRKnBHl6OC6
         t+MP5/q5B0GiO1/F6zERBk0JLSqLMyJW8/bqTr3Fuz/uS4eoxuQs4Wyjp4WBwReis/sE
         l5mXupn+Fe5DzestPu7l/hL0mzLBgmwHxE6W1CibpqzSp7nLZWU4xGanxPf3c3td5c7l
         5BSQ==
X-Gm-Message-State: AC+VfDx9EQ/9F58bHisPeLZ8dOkab2SA5fpT0cQfmqnaoUPeNdtat187
        kPJ2eC/vMrQfFWaPfEU+TpeXrBG//iTnmqDPZik=
X-Google-Smtp-Source: ACHHUZ5bMPc7vo8JnhawMRjyHVESgw0FA4lUgaqD/jCbrD/e7pbfVG89iIzbRVneVCM5h4vMCAzTtc+WaEEvluf6Tr4=
X-Received: by 2002:a05:6102:40b:b0:434:8b9a:96d9 with SMTP id
 d11-20020a056102040b00b004348b9a96d9mr9425434vsq.30.1683908702929; Fri, 12
 May 2023 09:25:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:c123:0:b0:3ca:d30:d5e with HTTP; Fri, 12 May 2023
 09:25:02 -0700 (PDT)
Reply-To: pmichae7707@gmail.com
From:   paul michael <pm3768072@gmail.com>
Date:   Fri, 12 May 2023 17:25:02 +0100
Message-ID: <CACMckHYA_aZ=NrzsQj9yUS==Kqsi22oN7JVEQUaxLWmuaJ-=1w@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Every time I retest your email, it tells me to check with my ISP or
Log onto incoming mail server (POP3): Your e-mail server rejected .
Kindly verify if your email is still valid for us to talk.
