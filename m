Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC8235371B6
	for <lists+linux-clk@lfdr.de>; Sun, 29 May 2022 17:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbiE2P66 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 29 May 2022 11:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbiE2P5F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 May 2022 11:57:05 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DCB06431
        for <linux-clk@vger.kernel.org>; Sun, 29 May 2022 08:57:03 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id l9-20020a056830268900b006054381dd35so6275941otu.4
        for <linux-clk@vger.kernel.org>; Sun, 29 May 2022 08:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=33H7bzlF73boyoKARvolMJlGymprQ+hHPrvlaQBxLsY=;
        b=AeVFakHwl3ShYUBAR+wdaOObcRjyc/4J4NF1aui8ojiGKJ3nldxlTO5LRf+moLwZ8b
         jPkn+YN7s/pob/eiNionXmdzFcqhA/Y3fNNZeD1uz0D/O8v2Gk5LtCoaKNERUBoJJNm5
         Zb0v8IpfdOHRyVWSVNnhW2paJ+fGO9xUvNVvSjOJiM+w2Nb7GXc47OQERjR9BWvycwwt
         0EPqSazouzwwZV046OphnIKEgnrK2OSTuE0zTOluJUGlZM/wnsi2+91UjLS/AjgWtpQD
         D5Eg3JgqeigtpHkBDFG4vek9r+NKDCsmWAjWYdkIb6UodoQUV74U/OS1I62CQYSeMOFj
         6WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=33H7bzlF73boyoKARvolMJlGymprQ+hHPrvlaQBxLsY=;
        b=wcK6CqNGbzxMBRxXHvyEFPQD3fZoif811trGWsqbkFIhAXnE+teEJNmwJ88zShbG/C
         h5bQTKD6DmMDT3SGHAFzAQxePQmuFaXCFGo8F+BJE6I9LuH8MgQQIsp7GpFi04FaQ7rF
         kz1JK/paWVNqnyGakH0zqM/9EboJ0fIbERxym5OeuF9aVFyRh8vI0ey1X+UqdE/u78SN
         3NOfGkrVFokXLo9Tt+MWu75/50VPE490pSXvtQR+tJxtQACfVxILueTMuH7qgES70NXg
         12QCO+bLNU+3deDhI7pRENkE823hhYGcfhMorqAdobpD7bJcUZQA8iOI4tc1rH+o/qgt
         H7CA==
X-Gm-Message-State: AOAM530TcAfxsiyMzJbloWwnzmU7onEcDK79gst1qiD4c0IIySdT9d/W
        WKwnpU+HTAk9AKedcL+Rgg3dDfWm+fChwx7jsZI=
X-Google-Smtp-Source: ABdhPJyL2x6MVUkHDYX54WjUueaKVacWuK/Q0kt8PsgUpOOA0Qa8tDhgfYiMmeFbY8lxlLx2xmPfewvciA4Sk1Geac8=
X-Received: by 2002:a9d:6e97:0:b0:60b:3a60:142b with SMTP id
 a23-20020a9d6e97000000b0060b3a60142bmr7434793otr.217.1653839822359; Sun, 29
 May 2022 08:57:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:560a:b0:a3:6e92:e156 with HTTP; Sun, 29 May 2022
 08:57:01 -0700 (PDT)
Reply-To: BAkermarrtin@gmail.com
From:   Martin Baker <m.evelinemartins@gmail.com>
Date:   Sun, 29 May 2022 15:57:01 +0000
Message-ID: <CAEvQOXRgPP5GhpUshtwVJ9oGTJHaFEEej5XOpmhHV+oYOMZHfg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,


I wrote to you this morning because I have something to tell you, please
let me know if you read my previous post today.
