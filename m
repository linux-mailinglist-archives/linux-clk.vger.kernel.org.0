Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D063255F1F7
	for <lists+linux-clk@lfdr.de>; Wed, 29 Jun 2022 01:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiF1Xkg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 28 Jun 2022 19:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiF1Xkf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 19:40:35 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C3A13F29
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 16:40:34 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id g4so13359009ybg.9
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 16:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=ecd1Q2yPx0A7W7K7jCuZP1F8wCmAYdVKX1aCc8pJ7gM=;
        b=QvNsVHWcwxDC0Ljn7LCNxtCUWV5DAzQ3PPXpGoHxkrgW+/voKwr44JOYQDkUJ3SbEm
         kAF+V6jDHT6StaDm0Y3fTy3Qe2XnBk0fE8RIX6LHeYJPkGVHqtxu0Tago+3gCnmqpgnG
         j4gphlk4w1fbsPd+xvESwhagVgTOJNjRUCSYskbwMZea+N+VtW0n1eexD8qCuZmW2uUk
         v9JbWWYcGjVkYXtNrHLF2zPt2k/MGoDMH/JO3ZUEQR/5eUrdFyiHwAPNXXG4/Jo14YZw
         qkI+ihHPqAGtT33pQTORhi0phBiJWQ8xitb3isY3OBcyYCeQDQsTkD926YHe2ZY5jwk0
         0jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=ecd1Q2yPx0A7W7K7jCuZP1F8wCmAYdVKX1aCc8pJ7gM=;
        b=zrejySvhJLeBgfaFAUJJtrj6w0n+zpe6e8wxD7poYOJTS5D3JRmIebN/gty7WQtu+6
         hnMfZsTBxJ0dUqGsm155lKgdADmLjJ9JThkY0pzb8WGXr59p4v53aMI/WBWARqo1j1jx
         4r9FmAt8M1+uelUVsZCNMh7nF1pqpFdiml2aUxA3KCIBhsiAny/o+yrxw7Tm7n5xOoC7
         SSZKqI16FlZrHL0ucefwHbpn0wBnFgibp/G7+2E3IIh4038E5p/DrXw8jD38iR3Rjn6U
         vtGC9ODhSw7hL6puusYiaFRiw1OgmGi8JYTbyzajlH3IA1Wup+GGR1SVKCkIxCN9HrUR
         JNUw==
X-Gm-Message-State: AJIora99Bn1bqoPwcz3V3+mc81Aku72TKNR05iURyfMEs8la0+mEV8xd
        iZ6BnEMVoVvO1UZdjDyEabYjPd8rtis3CZhtD0I=
X-Google-Smtp-Source: AGRyM1v8apNRY5qwfmEpxRjfh1Vv5DBYKpZs7VbnMm1KODl7Kg3sudOvj5Oxs0ws6KBdhaBJlgMjj/9IGy1wXk30Z7A=
X-Received: by 2002:a25:6f86:0:b0:669:22f7:b94f with SMTP id
 k128-20020a256f86000000b0066922f7b94fmr356806ybc.327.1656459633643; Tue, 28
 Jun 2022 16:40:33 -0700 (PDT)
MIME-Version: 1.0
Sender: d7372548645@gmail.com
Received: by 2002:a05:7010:1e11:b0:2e1:eb33:312c with HTTP; Tue, 28 Jun 2022
 16:40:33 -0700 (PDT)
From:   "Mr. Jimmy Moore" <jimmymoore265@gmail.com>
Date:   Wed, 29 Jun 2022 02:40:33 +0300
X-Google-Sender-Auth: B1Rq75kaNfm281ew3BKOuYfuR6Y
Message-ID: <CAGcADL_ANBLQJYw9RdrTNA7Qp6_Or4LmBOcmgzWskWzitGPNRw@mail.gmail.com>
Subject: UNITED NATIONS COVID-19 COMPENSATION FUNDS.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,LOTS_OF_MONEY,MILLION_USD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

UNITED NATIONS COVID-19 OVERDUE COMPENSATION UNIT.
REFERENCE PAYMENT CODE: 8525595
BAILOUT AMOUNT:$3.5 MILLION USD
ADDRESS: NEW YORK, NY 10017, UNITED STATES

Dear award recipient, Covid-19 Compensation funds.

You are receiving this correspondence because we have finally reached
a consensus with the UN, IRS, and IMF that your total fund worth $3.5
Million Dollars of Covid-19 Compensation payment shall be delivered to
your nominated mode of receipt, and you are expected to pay the sum of
$12,000 for levies owed to authorities after receiving your funds.

You have a grace period of 2 weeks to pay the $12,000 levy after you
have received your Covid-19 Compensation total sum of $3.5 Million. We
shall proceed with the payment of your bailout grant only if you agree
to the terms and conditions stated.

Contact Dr. Mustafa Ali for more information by email at: (
mustafaliali180@gmail.com ) Your consent in this regard would be
highly appreciated.

Regards,
Mr. Jimmy Moore.
Undersecretary-General United Nations
Office of Internal Oversight-UNIOS.
