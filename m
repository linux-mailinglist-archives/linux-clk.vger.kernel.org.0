Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9496167F083
	for <lists+linux-clk@lfdr.de>; Fri, 27 Jan 2023 22:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjA0Viw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 27 Jan 2023 16:38:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbjA0Viv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Jan 2023 16:38:51 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 006A224C99
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2023 13:38:50 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id x26so2953481qkj.4
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2023 13:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkjlJx23CrkCdR6Z9AlaV1vvEzLjMrV/VSTIV1fEBgE=;
        b=mdSFmRNUmWQq+PcXXLwJph7CYzqDTSPiartUvARRGxoGc1aVC4POxGBX2FggO/3pu3
         tQFZhD+2V6mS+vdDTGCdjH8/FrQxi8HRqTTNNPcMu5W5wnxcbINbEwC2uNxi16VqiCrO
         spk3LNSUUGWq9NS1/ROkCfB5Ox947kYiSkJhopYy57uEk7X1FazkJABT0QaaWtsjwE7r
         wO/3wn0B/X9ffj10o5BpGlMf6j3OkxuiwccZ79tRyIm09vaB2+BsgheNIk/XNgIon8r0
         AAe5cGFFuaXLmz3cJvk7X0bAKvEdrCkDma6CLHS4KCzXss+wZOUs7zLIkLGlwB9b1ui4
         u6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkjlJx23CrkCdR6Z9AlaV1vvEzLjMrV/VSTIV1fEBgE=;
        b=TRTxPEQ+LFJ7zDFVF1HPT4yCWg4jywOLLrCqC32fXDzlKIkO7gB+YTOZL8FPFcqtor
         ju8RLPn8dJG8itAPKpPly6caeaLcplEmDW3vmbfdjMgjBfwHq4DKI6c4rBeh5759Vxkh
         NMKx2QExDL6FhJ5EzKTGw3cWJiBeAjjmNjxG4aOhkL5Njpf51Z2TaftxGoVtYSwmgCLB
         5MrkoQzNwSQrtyxaOgyhBlDk7SKv0sKTLgK97al86o+Svk9uG/560Ehsz3qNsWz3XNcN
         hwI1VdKgI1B8YFTZ9XItXqHLArjfcBFGlHQcP1G4EzQYy9MwnIIACKCzLvcOhjKfXLwy
         t0xQ==
X-Gm-Message-State: AFqh2kqOp7EKEBUU1KU0S0i4M2pxoIZwvCLTe3kJYMxi7gQblVrYqYux
        PF/oSWzO8qUdv6c7qKA0rGfc8wGnBU63LmlJaHk=
X-Google-Smtp-Source: AMrXdXsk2W296jrqnhgL8kKhRiSFwc9CWIOCXF0g3sGOXBKyQYL5TqE8x1jplv4n4pOuAMZpZqMCweE4nKqi6Xud/Ak=
X-Received: by 2002:ae9:e214:0:b0:708:ee3b:e153 with SMTP id
 c20-20020ae9e214000000b00708ee3be153mr1126380qkc.352.1674855529998; Fri, 27
 Jan 2023 13:38:49 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:622a:2c6:b0:3b6:4a9d:4c83 with HTTP; Fri, 27 Jan 2023
 13:38:49 -0800 (PST)
Reply-To: mrsmargaret1960r@gmail.com
From:   "Mrs. Margaret Christopher" <alkasimabubakar644@gmail.com>
Date:   Fri, 27 Jan 2023 22:38:49 +0100
Message-ID: <CAC84WCrZJNgrSfmMM24wp7WU8T7ZCPvgPUyXRBgHx++ro78g4w@mail.gmail.com>
Subject: Hello Dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:734 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7452]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [alkasimabubakar644[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [alkasimabubakar644[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

-- 
Hello Dear

  Am a dying woman here in the hospital, i was diagnose as a
Coronavirus patient over  a month ago. I am A business woman who is
dealing with Gold Exportation, I Am from USA California i have a
charitable and unfulfilling project that am about to handover to you,
if you are interested to know more about this project please reply me.
 Hope to hear from you

Best Regard
Mrs Margaret
