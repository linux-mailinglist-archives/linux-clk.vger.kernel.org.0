Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59271502C04
	for <lists+linux-clk@lfdr.de>; Fri, 15 Apr 2022 16:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354573AbiDOOjI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 15 Apr 2022 10:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354575AbiDOOjD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Apr 2022 10:39:03 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBE1A6E3E
        for <linux-clk@vger.kernel.org>; Fri, 15 Apr 2022 07:36:33 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id c64so10101727edf.11
        for <linux-clk@vger.kernel.org>; Fri, 15 Apr 2022 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Gh17tsDRSQFxH17SjRmyw7jE7M/XUCynsfnEDNujD7A=;
        b=NPiXc3gdwRfweyq9uL7iCQTTkrBW/lJw/BPOOciazwatFrmQq/Z0VPzu/OtVpHi6EA
         Q4n3iZZ3pjItlGADHl76VZp/l8PXtw2erm4BA/x4q5NJYPKX4SELSCPXf7Q7yb8Mfixm
         /gESouGNcccB9pK7gVvNSIVj3r6RMBZesOZIgf+yS7FK61cDbeVwEa7zsjyWhahlKLcP
         t3TCLO7h1t9r/Y8S9JFe8/NKhvkGA9Wyyi3pb1NwUVN2LBCfYOk1tVlsSTKHiavvz+LF
         /8kjwmPK01/Yc6pSrXHTgRWjvjgqqLD5WkebkIKBgrkQE0TxMjaTUTtYDic5lMhAJMt3
         w3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Gh17tsDRSQFxH17SjRmyw7jE7M/XUCynsfnEDNujD7A=;
        b=rQ8UeygMMeFFqkcW9CYy0vp95SBWC4Oax7lWjQ52pEsU47Xz8169gSh7qMspULd4PM
         ZMNwUJo7lb7sBv0MpuprFD/L8A8JU5/vKn2zEuFcYhOG/G849usL2rcH3RCedCCQX8DF
         B6CdHYy4CBs1UwRKedqRIRY5CQzsDk0p4v9HzfbpOr5uGxTx3DWao+uWoB34Cm9f2ulV
         4G/pmFq6mpKq6NZreF2+lye19OY0Zbb05Mtc2bio+Gfa6Fy02chaNTEGvcLirjlL9ion
         LxwPVsbcDOGM4dhBW+BDeaN3NCY7Zh8yxqzkBVI0wk54vytF5CYLTvUOQyKjFpycr3bC
         f+FA==
X-Gm-Message-State: AOAM533bRK22Yx3YV683r3Ah0MxwJeE32rJsOQM3dFBk5zOL0thPkqDz
        3shvBxRhIPV2Kz568uy3YoNksS0aZ6NlR/SDONs=
X-Google-Smtp-Source: ABdhPJwU4FAm3bUO+vAXDPJ1JsgQW/neoC/f6L0NzHd3gWzjpBMeInzpI0qCIG4QXOorW38FEc1zBj9aiJrbik/w+Fs=
X-Received: by 2002:a05:6402:354d:b0:41d:dfe:6a8c with SMTP id
 f13-20020a056402354d00b0041d0dfe6a8cmr8577527edd.286.1650033391828; Fri, 15
 Apr 2022 07:36:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:640c:2dd1:b0:155:1376:f4cf with HTTP; Fri, 15 Apr 2022
 07:36:31 -0700 (PDT)
Reply-To: attorneyjoel4ever2021@gmail.com
From:   Felix Joel <starotchi200@gmail.com>
Date:   Fri, 15 Apr 2022 14:36:31 +0000
Message-ID: <CANd7BbeKMeW0MPPjSGZHj-sJJHxffM=539kQkSvfnvNrYWfsSA@mail.gmail.com>
Subject: sto aspettando la tua risposta
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:542 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4998]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [attorneyjoel4ever2021[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [starotchi200[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [starotchi200[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

--=20
Ciao,
Per favore, accetta le mie scuse. Non voglio invadere la tua privacy,
sono Felix Joel, un avvocato di professione. Ti ho scritto una mail
precedente ma senza risposta e nella mia prima mail ti ho accennato
del mio defunto cliente, che porta il tuo stesso cognome. Dalla sua
morte ho ricevuto diverse lettere dalla sua banca in cui ha effettuato
un deposito prima della sua morte, la banca mi ha chiesto di fornire i
suoi parenti pi=C3=B9 prossimi o qualcuno dei suoi parenti che possono
rivendicare i suoi fondi o sar=C3=A0 confiscato e poich=C3=A9 Non sono rius=
cito
a localizzare nessuno dei suoi parenti, ho deciso di contattarti per
questo reclamo quindi hai lo stesso cognome con lui. contattami
urgentemente per maggiori dettagli.
Cordiali saluti,
L'avvocato Felix Joel.
