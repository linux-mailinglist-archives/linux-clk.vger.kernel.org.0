Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75033700CE7
	for <lists+linux-clk@lfdr.de>; Fri, 12 May 2023 18:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbjELQXA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 12 May 2023 12:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbjELQWy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 12:22:54 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5ECA93D1
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 09:22:53 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9659c5b14d8so1682392466b.3
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 09:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683908572; x=1686500572;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=iVjUVD0VMTGh2bCVQlA52u7gIklZ+tr1h/DGyA4Bazwk2ZO6eYVQB+qdXG/imjLy6x
         scnSpxTMPonHmeKxMNkrlNXz3etJF7l+gwDpPSIUQTUMB5VmVbCRyctp88HRmn+meOPh
         8C7fF0GbWY2msSy0OjzR8btsS2EKiv4s3wWGiLU81Io4gPWFvBrDSBiIsisfP9KGK4+v
         drKmWEeJwCBtSP3UF44VwKj92JpzHemk81N184FBuF3cDDnY8okGfeyv9P2/fANnGnDg
         PZmX3WlZ1vFUvd8c3jyzclxe6XUCSO0DCGW5IbahPJQtITMaQFtY79yD/YmmHp0OCYEN
         p8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683908572; x=1686500572;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=bbRhDkvzoWIzG3P+Jfh9v2qFsxYzsQFOwzmSgqnwuaNEbHbBTBedUDAsJhMnVQQ5fE
         XpuEg+/JqITKp0oQFrhuAH7kUZj6KeIPRnd1AmVaCLQc63rVocI7xdSC6qdwjj5V+5DB
         uUO47Vuwsi8wW+uxnhIRzn4tUuQgxUzOgJDj0urzCHNvvjUzpFhonjXTz2PRh+xIWoI2
         Py+srfhwkJORVWbLyQpFACI/vlCpHgdNCRpdA81K1cdXs13ElRZZQZVe8dspSO4bj3Lm
         eoB1kWlvZg65Z0nQZNmgwrUQJyJNXM1g4zXfidKPSGyMT1LPzIbIEZa9MutaVUsivZc/
         Wu5g==
X-Gm-Message-State: AC+VfDwPYeZhw9GTEWTWsty17BYxblYlBM/dCdCsla0MhSEKJ6IPrTE3
        5prPSmP1mR64vjUbz6KtnJalDYvt+s2ZviIlUQ==
X-Google-Smtp-Source: ACHHUZ4u+/6scXOsxWVUnQQ80T46ofSuATs3MU0hjZ4McmJp9Q0R2jlOF9WenLKCiiIaHQOJ583re2X9QfvgMYYScqI=
X-Received: by 2002:a17:907:d1e:b0:965:66dd:78f8 with SMTP id
 gn30-20020a1709070d1e00b0096566dd78f8mr24870123ejc.56.1683908571990; Fri, 12
 May 2023 09:22:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:9343:b0:906:449c:e24 with HTTP; Fri, 12 May 2023
 09:22:51 -0700 (PDT)
Reply-To: pmichae7707@gmail.com
From:   paul michael <pm9568521@gmail.com>
Date:   Fri, 12 May 2023 17:22:51 +0100
Message-ID: <CACSDF=_Q0Jc2dbOa+Gc_dsKBApyd521ydG6kU2X0pEXvmUXpkA@mail.gmail.com>
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
