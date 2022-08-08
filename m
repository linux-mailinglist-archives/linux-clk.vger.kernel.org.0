Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61C8B58C204
	for <lists+linux-clk@lfdr.de>; Mon,  8 Aug 2022 05:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbiHHDZo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 7 Aug 2022 23:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235451AbiHHDZn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 7 Aug 2022 23:25:43 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1EFDFDE
        for <linux-clk@vger.kernel.org>; Sun,  7 Aug 2022 20:25:42 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id m4so14248947ejr.3
        for <linux-clk@vger.kernel.org>; Sun, 07 Aug 2022 20:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=lcZ2t0LpE/APjnxBS48DvMi6cCGFT64qJ81TBG1Fo/4=;
        b=DezWQVGGRn3Zs3y8sRnfYd6Nypx9GsiJt6pkx/5s4HothUfIbq/jyX3CoPeTw9tq7i
         kFkGpenAKwsTCa7LM/xD0/okD9T1WY0eCGYunwlNccvkaNfqxa0OsvRySrKXTOGBgMR8
         UcLiOnnLy13JVbepTh+lZAZJ8ymSDccY/53RfcoxFOyAWuBiWg91uNpl4kQhk0ZkOR+U
         xzcCHXOwASTJaTXdbbauv2GRTCT1+alnPmmP0RuwwvDz1ZcOE1ZM7QAvJTlAXg7xo1Te
         98bVR6bSX8n3Og+hMDQFJUHb5KHVWmAV4Xc5vINMJkz3TTJ5cSyhQgg6PUp1l/fni05R
         tN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=lcZ2t0LpE/APjnxBS48DvMi6cCGFT64qJ81TBG1Fo/4=;
        b=3Le6gt1ApBK2lfyYc79VL2lnUXaW8OYsuyUlzhtTEyitBpYlNzgO051yEgvJfK7iM1
         ZF8w+G83+4QWHpDSVPloyI4L3gHb2VBHiWPWiKl0DoTK+j990winjQhXJUn5aI8QA02l
         pGrCdF0d6dQFN2YCudOygAKnXGxyW7OCwndUo2bPdqg+UjA6sKUndNHucrQOPApQnQJP
         lpGzMUPdfzQWn9nrSi4+E3WI9NpZSywDFqbLcLitpFy/eRmC14hD/a+5cAd6tBnEVkc2
         844d7XgLBeypresVCDdk7y9nLSW27l7Yjz/VdELP93bgKbJyRlCxCbuLMfwNDug1eIjE
         Kxgg==
X-Gm-Message-State: ACgBeo315h53Po2zVXHpkj4XeAWI25GAXqD9jL1ZEUZCpPRheZMV9bn3
        jgZtt4K0KuLFQf+SMQVJrzyimnYPOp/yrwD/txM=
X-Google-Smtp-Source: AA6agR5fe8+6491VsLPVP7a6qz9wpRLsLLhmT2p3HQXQ1ISHxTzyB0wbapldoUmhzEUV3wCOU09SetGj4CLpSDF4SYg=
X-Received: by 2002:a17:907:628f:b0:72f:57da:c33d with SMTP id
 nd15-20020a170907628f00b0072f57dac33dmr12238898ejc.374.1659929140467; Sun, 07
 Aug 2022 20:25:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:2482:0:0:0:0:0 with HTTP; Sun, 7 Aug 2022 20:25:39 -0700 (PDT)
Reply-To: stbzan@gmail.com
From:   Sheikh Tahnoon Al Nahyan <alsowaidiahmed88@gmail.com>
Date:   Mon, 8 Aug 2022 04:25:39 +0100
Message-ID: <CAChuT4atF1Nyq4hOaH2Lgsoeo9vqA+cTtMMH5HmHaKO53XL-YA@mail.gmail.com>
Subject: Hello sir
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

-- 
Hello,

Sir, i have business that i would like to share you.

Thank you.
