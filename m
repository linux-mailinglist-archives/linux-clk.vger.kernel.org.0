Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 182006EC482
	for <lists+linux-clk@lfdr.de>; Mon, 24 Apr 2023 06:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbjDXEs3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 24 Apr 2023 00:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbjDXEs3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Apr 2023 00:48:29 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E9D2D4A
        for <linux-clk@vger.kernel.org>; Sun, 23 Apr 2023 21:48:27 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-52160f75920so2872575a12.2
        for <linux-clk@vger.kernel.org>; Sun, 23 Apr 2023 21:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682311707; x=1684903707;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=S4MWetVyGuJkR+d2b+kETuR4GYLUQPumm3RGwW47pRXQFQOdLJT3+LLUxm17PBTJXE
         C0bYbI64FWeQ/yT8FygGREvqUm3QQ/zjWDMJs/4QE55jDPon2nR6Nm8Q08UAzIsXw/iy
         A/qMAu/+q0J/Jj4CLpdC8yjnSEIrFk6uQubGvqbgjDsruaSeaew6Ap+UhqZzmjvWjk9I
         aCRnfVP5fiGGdWRV6fRFx/WguBhuFsOg8/MvvMIjS6c+gOuOqluL12bzxAU2Ac+9O2to
         5/T6O+opC5niw0hh8v4g2B2MUz+/R3MBW5+5ANBM7s6tqFzymT0BkiqtRaTXcfymPbnt
         tQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682311707; x=1684903707;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=RGwLlqzwMeIdvwFmzLJ8LuuNmIwtYuV+QNgUHAd2S1ACvAk3HOjhu3mOOxZaZv1kJh
         04j99el07y1H9lyFZEusiCAYmlYhSc9HUx8+kZYMC2zv5fpDDmrT4tLQKXPM7sMZTPdn
         cYcTy9CRELi6lj3CqbWVbQMCxq1PlD0hxm3FRyHPmg55vSDXSJyj8ObBhBqV9VUkK8sE
         UXQncoSMRm3g5ExuAqPHoc/hA7qW2L7gmpN34p6Lbqs4PPSvh2dFbOyHng+1h6M3m4FB
         f5bb6tFJqzq65r6KpFlRi97hN+Df8CV7SU8Bm1LMnubAnUzg7PJA4z05jqHazwbUf3qd
         CO/w==
X-Gm-Message-State: AAQBX9fI06efuLZ+PXqGMAAv49vMOJP3BBp4HcFslLrTy7T7N97dMM5l
        Y00yy6CBETHZruSplOgw50EOzFlADOwUoALYN8M=
X-Google-Smtp-Source: AKy350ZoU4KjhhZ9bPPVymKEBwfYeN78cJHFsMrwLq87pewV4tMsahjBH7xnnM/ELOxol9uZPb8MmhASER0FLWBXiek=
X-Received: by 2002:a17:90b:4d91:b0:23a:333c:6bab with SMTP id
 oj17-20020a17090b4d9100b0023a333c6babmr11588222pjb.23.1682311706870; Sun, 23
 Apr 2023 21:48:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:234e:b0:49c:a5fa:37b5 with HTTP; Sun, 23 Apr 2023
 21:48:26 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly004@gmail.com>
Date:   Sun, 23 Apr 2023 21:48:26 -0700
Message-ID: <CANcht-S5UB0CB3nXVDvrxwLeZv1bWbFSPSDtZ3uw_3kPuoq9BQ@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
