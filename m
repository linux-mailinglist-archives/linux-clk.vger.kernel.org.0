Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE0284EB5BA
	for <lists+linux-clk@lfdr.de>; Wed, 30 Mar 2022 00:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235927AbiC2WQi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 29 Mar 2022 18:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236422AbiC2WQh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2022 18:16:37 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9FD186FAD
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 15:14:53 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id w21so22186565wra.2
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 15:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=mumkLTLkMOiUwqB2j7X+6enWeHp5IrgU+n+bh9P57jERvtKI03X4TAc+/51AfTRqa5
         uf/HksEwqvCDloUreqb7aP3peU1pvJpTxvad7vlPGu8TOfJfnrbvFSMmOyadAReHxHst
         yNJX/XaAApW55NcL1Ia6rA1gnIA8kIgivH+MQWUsfRiRwYeaUZwCJmeaqv3bJD00loeq
         RCgzRNcpnhYg8Hk2RuJTxWsR8FlBgkvJrd0oqO/vawRYDGIq9FMddPziGGdOiJcGYQO1
         myShR694ZRpHb8gHP4g3GCZVW0gbFmiZvphTBJArxZvXcoqwS9PtbdHsAEjHde+GFUAS
         ZESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=UjGF68KpDg9S3cPf0ZDyha9Hdju6tPrYpxjw218l5dprKeSaxxwbc3/iidxG/yiNmp
         uQf3vXW4IGMkrD5Yqoprfg8O2Ak6H4uj2cWrmYpYNc2FcvcMp0cvSHeq0yn9P6R4xD9H
         nYU5g7I7w07qsPN8WKPi0j7HzmpiFZJgScH1GabJilT+sEJnhz7AKTkl/G5xciPQaehg
         QPTJNRzLC7pGULaHbNieCvTBXYsuXzQjVKD12F26gU7e7AogLer3KESPArQb919QAQbs
         pDzm6DCeeT35rkqmZCQn1AXtYa/ZIDK9srxb0tj2hkx/CeNSNDmVbJvMRLwBE91eN6/5
         S2mQ==
X-Gm-Message-State: AOAM533sf/sy5VY8OZTYuInlqhLjdFwAEeXOGybH8LDUSRk6P10+BfNB
        EVY0+TNkR8LmxlfvLl7ED9A=
X-Google-Smtp-Source: ABdhPJzilisjl8xWrSj7trgncqDk85GkrW6yo602Xrn1q7sf6qDaetG33ejxsoamt86Vark/NkCmFw==
X-Received: by 2002:a05:6000:156f:b0:205:c541:3e8e with SMTP id 15-20020a056000156f00b00205c5413e8emr14060951wrz.581.1648592091774;
        Tue, 29 Mar 2022 15:14:51 -0700 (PDT)
Received: from [172.20.10.4] ([102.91.4.172])
        by smtp.gmail.com with ESMTPSA id m13-20020a05600c3b0d00b0038cda9f92fasm3436653wms.0.2022.03.29.15.14.46
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:14:50 -0700 (PDT)
Message-ID: <624384da.1c69fb81.6baa0.eeb4@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:14:39 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
