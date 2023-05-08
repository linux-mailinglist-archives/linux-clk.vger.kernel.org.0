Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03D986FB253
	for <lists+linux-clk@lfdr.de>; Mon,  8 May 2023 16:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234472AbjEHOMe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 8 May 2023 10:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234429AbjEHOMe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 10:12:34 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177DF14E72
        for <linux-clk@vger.kernel.org>; Mon,  8 May 2023 07:12:32 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-30626f4d74aso2857502f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 08 May 2023 07:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683555150; x=1686147150;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgrUjkOkBheLdoIJfJaGCiwe1NhOU5wVsAz8jlCtsAQ=;
        b=bHCjXC/Z67ERKq4e6XsgMJaPR5p+ym0N/lA64PkeQTZuYYvKZ8UlVVCev+pZPUF25L
         9bO9St0LyD78Bup6rAppm/whEx6kTRlA/8hbT7RPCgJKmlvxcmABUSZ5uvkb+BfW4Vgj
         JRjUuglAbLhbt7DnobU5YDy9iPIqXikTsox1JVj0a9Pxobe5KFHDrBlvuHiJKOgrxL/L
         muy4GqejxHOztANhKQmdaDufF+Sr8C+L375Ps+ynK6pWLaP1gIPn8roCUb1Z+lREyWm1
         C/Xz6BWC+lqI2ILJACcDOR/3qYtJH/LcETNPUUDKiGPyyBZO4aiWdGrzbXGblkNwjOXZ
         5G0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555150; x=1686147150;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PgrUjkOkBheLdoIJfJaGCiwe1NhOU5wVsAz8jlCtsAQ=;
        b=AFq+xiw8nT+TN327RWkpP24Q6xrJ72Z5cSQdQ/BTz6A9QBa0PCFxYIzKgRnmfjUkDQ
         0er0hRo9d4vZF5px/DRBZHDx99/WtlfXSBW1Ylfdbm2LPrbMLuO6Nt8LajsBXIUpiiPB
         P1lz7nNMGAurLr3S411/knexdgFQmYM5MP+aQDk2ftz4FWVXwZAC78oE8qOpGjbNFWmu
         zb4/nF6RzTz7PB4xoY/3opxrNhQ12B5YX4a+L9nFY1VY/FLjr5xIxGfIhVpw070WHYzH
         15f7cCojz0YR7YAycPXJ69kzXvHHSkvIYaVo7d3YdHEZcDBKZXEW15crONmTxeEVObim
         rGVA==
X-Gm-Message-State: AC+VfDzQavDMGLqPwFF1bbpOoc2bs8u0PROD27XXtTBlMM0ZRNRdRtyF
        KwKnS6+xAz+OafQ4FhrXD40Mz18c3fa4bn2URqU=
X-Google-Smtp-Source: ACHHUZ48194J2FkcS/j9BcblE8NTuZk0W7hTXLM/6Egdtcwg8+D6vad3IZdSMcpQRBc/w8NRU2SqoczCRuq/QK//Dco=
X-Received: by 2002:adf:eb08:0:b0:306:5f29:f16c with SMTP id
 s8-20020adfeb08000000b003065f29f16cmr6887548wrn.71.1683555150207; Mon, 08 May
 2023 07:12:30 -0700 (PDT)
MIME-Version: 1.0
Sender: alimahazem01@gmail.com
Received: by 2002:a5d:5963:0:b0:306:37d1:ad50 with HTTP; Mon, 8 May 2023
 07:12:28 -0700 (PDT)
From:   Elizabeth Sayouba <elisabethsaqyouba@gmail.com>
Date:   Mon, 8 May 2023 07:12:28 -0700
X-Google-Sender-Auth: Wso52es0SSjDQLfp_CXYU_tJhS0
Message-ID: <CAAcvc8Kv7KbgKTW6cKqmauVwtRJKeHpnRqDf9UsbCJNg2e52Pg@mail.gmail.com>
Subject: Re: Greetings My Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,
        MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:442 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [alimahazem01[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [alimahazem01[at]gmail.com]
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  2.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dear God's Select

I am writing this mail to you with heavy tears In my eyes and great
sorrow  in my heart, My Name is Mrs.sayouba elizabeth, I am from
Tunisia and I am  contacting you from a hospital in Burkina Faso. I
want to tell you this  because I don't have any other option than to
tell you as I was touched to  open up to you. I married Mr. sayouba
Brown who worked with the Tunisia  Ambassador in Burkina Faso for
fifteen years before he died in 2016. We
were married for eleven years without a child.

He died after a brief illness that lasted for only three days. Since
his  death I decided not to remarry. When my late husband was alive he
deposited  the sum of US$ 8.500.000 Million. (Eight Million Five
hundred Thousand  Dollars) in a bank in Ouagadougou the capital city
of Burkina Faso in west  Africa. Presently this Money is still in the
Bank. He made this Money  available for exportation of Gold from
Burkina Faso mining.

Recently, my doctor told me that I would not last for the period of
seven  months due to blood cancer and hemorrhagic stroke. Having known
my  condition I decided to hand this Money over to you to take care of
the  less-privileged people, you will utilize this Money the way I am
going to  instruct herein. I want you to take 30 Percent of the total
Money for your  personal use. While 70% of the Money you will use to
build an orphanage Home in my late husband's Name. And help the poor
people in the street. I grew up as an Orphan and I don't have anybody
as my family member, just to endeavor that the House of God is
maintained. I am doing this In regards to my late husband's wish. This
illness has affected me so much. I am just like a living death.

As soon as I receive your reply. I will give you the contact of the
bank in Burkina Faso and I will also instruct the Bank Manager to
issue you an authority letter that will prove you the present
beneficiary of the Money in the Bank, that is if you assure me that
you will act accordingly as I Stated herein.

From Mrs.sayouba elizabeth.
