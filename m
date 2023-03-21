Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6256C315D
	for <lists+linux-clk@lfdr.de>; Tue, 21 Mar 2023 13:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbjCUMTF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 Mar 2023 08:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjCUMTE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 08:19:04 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977DB33CD7
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 05:19:03 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id i15so4809378pfo.8
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 05:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679401143;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYqkAHx4YZlodAh/pQZnASbt6AOErr4tdDt3mzzR2k4=;
        b=iVP7d8kNwUz42h2uYbr+JXIHDL+FuWYmzBRCLqmLWRrO16o9LlT/11GnQucYlljOkA
         AC1Hry9J6qA3uKbRPAPo5FdGJZVLN2Tk3erllNp8TjV2iVxMgB1Kb40972s//MAyrL3S
         n6dphZWNXmz7xuprYXnTpCOt1eatD+MfdVGquZd0x08d32DbgAKYICKlHikM5SVKtt/N
         I7eAPf6onX+S1BhhwntHMttoYpAPOLMNK5P26+KX6miPivkz7iU3oznjhRopBUEu+JUZ
         3hZ562Dieprl+uwhPE9FLh82z/LdiEeBgRu6QyRM6P2mrtNah77BAQ3wK5K3o/woKMjz
         lKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679401143;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tYqkAHx4YZlodAh/pQZnASbt6AOErr4tdDt3mzzR2k4=;
        b=WVIa54p34ZqT/apKnp6C3WTQO+2Mu2ArqC2Hy8yVbcI30uMKxd9uCt30C8Y8+71rg4
         ozUHFjsjCd0Vrh3LctdPAM+cbkCE5kyBxuDLuw2DAMYi9l3kHdu9BDuF2g/Nj1sGpGXT
         Ru1HpamM/RCqMOVD3GSwCVH2iuly6WLgSMdmZph1h3sXkeRAyO4xk3sikYCx2OYaSrFi
         nja1e4g0J7QK+TcfW7OE3eOpd5UmZoj9S2y+oh0bmmVn3wj+1lVfPV9Cxa6NjdHcFrba
         iIGhPS6sDSG34u92MiVC+G7OYp+mU8NLq/x+FYlZ/HEUjpJhb1nEiMW5LUbDw7bdnEwV
         iauA==
X-Gm-Message-State: AO0yUKVBoamgmZUb3FyxuTiPsTNzIwEC4izVbcwR2XiERbkNu/XPsjG1
        J5wfEqkovFMwr3TKwpWPXlxyFsUeTuC2E2GStYM=
X-Google-Smtp-Source: AK7set/On06z6TUJjID6yEA6YDrFhoDms0XZe+zMJG3/3OCnBa5LyPmA0KIzpZCByASniNT1qqYmJdTuXvxh72+tA6E=
X-Received: by 2002:a63:9a51:0:b0:503:7bcd:9806 with SMTP id
 e17-20020a639a51000000b005037bcd9806mr574915pgo.4.1679401142851; Tue, 21 Mar
 2023 05:19:02 -0700 (PDT)
MIME-Version: 1.0
Sender: karenlazarus87@gmail.com
Received: by 2002:a05:6a11:cb1d:b0:471:d95b:a9 with HTTP; Tue, 21 Mar 2023
 05:19:02 -0700 (PDT)
From:   Melani Wormer <melaniwormer@gmail.com>
Date:   Tue, 21 Mar 2023 12:19:02 +0000
X-Google-Sender-Auth: bDnKavLyD2SMhTVa7fRkwTKdq4g
Message-ID: <CAA3GAFFXd8Sig9+Vo1KUr3yya=aTxYX4AU0vqCCLFVY47UUFcQ@mail.gmail.com>
Subject: Re Hello Dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Honey, how are you? Are you capable for investment in your country?  i
need a serious investment project with a good background, kindly
connect me to discuss details immediately. i will appreciate you to
contact me on this email address Thanks and awaiting your quick
response yours Melani,
