Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2938A4D625B
	for <lists+linux-clk@lfdr.de>; Fri, 11 Mar 2022 14:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346684AbiCKN2o (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 11 Mar 2022 08:28:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240969AbiCKN2n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Mar 2022 08:28:43 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9016511C3A
        for <linux-clk@vger.kernel.org>; Fri, 11 Mar 2022 05:27:38 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id w7so15032207lfd.6
        for <linux-clk@vger.kernel.org>; Fri, 11 Mar 2022 05:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=OZD6KXu0/6DkCWGxPHcUUj7jLh83t4i0P+4wK8zulTE=;
        b=bHibzelkrdxR92Gp+qZtcdSMWn1uzHd8MbDxUMCtFEUVzdJFCV6cNhx7A7WRakQuFl
         NQgacUeq8t/2ULKdadOVAMoAQH06aT4tWXAXJvbfMHGoi1GDyBd5uF1XxJwHdJKBMC77
         0ZD716j/Z02BdL4cOCTa3iNQuWYNOTi2qmjrpTmOasREG4RGKrjvU7nOgwx+m/MxsPc4
         mogExjSEWpTPfrmF6DwAAcfkHnbn8A42ifltNwcQe8pNrcc1hTpzmbGySvO9pTPI1kFW
         VjzZ/RsuJ+QUmtn/eaHNdAWisOyz4gQNC8r0aVJpgslImBHiU5Fu6IxAzltLUdJPM8i1
         Ue0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=OZD6KXu0/6DkCWGxPHcUUj7jLh83t4i0P+4wK8zulTE=;
        b=WrPLWi8nq+TCiDALBkMFHKHgVECXKxtgHd0W2eVEPaEPhCJfQPbFnCFSRY90acfphm
         jUNOANQLIDO28PyI3FBr9l1U68hU99CM35SuBdr5rxVzUCoc3TMl01jP2k9q9eHwTExF
         5CShjz5kbtejUJn1qMLloXW35OHPQjVj/SXeoAYy32xOZOJQwjVBW7SmON+tWrPVlzF6
         +hp7jzHu9rKqoDvOTPAAq+GQiLJsBjGrSB1N6s9R0v8VqyAAHg0Bqu9VdfohRVip1Q/G
         ZDj1kuo82Q+eFpyhh/E+Qn5wzKgVgX2aeTUi7sQEoD4bxKZQ5TvRrOq1UycQEZCcslgu
         a7Jw==
X-Gm-Message-State: AOAM5335Exr4L0JJhmckJmtHNlJcrnOlLfbcPT+7bcsdYSpr8nJgy+Q/
        ofM2RN0A2IU/elMZju6KWfpLm7HRe94mJKx2a0A=
X-Google-Smtp-Source: ABdhPJzLLnRvBAlKRZK68mCinEPzZ1kC+XbNVw7HbNjqXLJ0VPSM5EehG/1CHixnvuV03X4zF+/89Q3zbHph/kf+0bQ=
X-Received: by 2002:a05:6512:32b9:b0:448:27f8:3e67 with SMTP id
 q25-20020a05651232b900b0044827f83e67mr6004375lfe.106.1647005256477; Fri, 11
 Mar 2022 05:27:36 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6520:4d86:b0:1a3:7e46:cc53 with HTTP; Fri, 11 Mar 2022
 05:27:35 -0800 (PST)
Reply-To: susanraphel757@gmail.com
From:   susan raphel <mrzsusanhelms@gmail.com>
Date:   Fri, 11 Mar 2022 05:27:35 -0800
Message-ID: <CAOwG6GP1DbUfCEeDnKq0HBczsX1jjTv_1F=mc7NOSeGG28V21w@mail.gmail.com>
Subject: Cry For Help
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:12a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrzsusanhelms[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [susanraphel757[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

-- 

-- 
Dear Friend,

I warmly greet you.

Please forgive me if my plea sounds a bit strange or embarrassing to
you. I am 63 years old. am suffering from protracted cancer of the
lungs which has also affected part of my brain cells due to
complications,from all indication my condition is really deteriorating
and it is quite obvious according to my doctors that i may not live
for the next few months,because my condition has gotten to a critical
and life threatening stage.

Regards to my situation as well as the doctors report i have decided
to entrust my wealth and treasures to a trust worthy person. Get back
to me if you can be trusted for more details.

Sincerely Your's
Mrs. Susan Raphel
