Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A269C7020E3
	for <lists+linux-clk@lfdr.de>; Mon, 15 May 2023 02:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjEOAzI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 14 May 2023 20:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjEOAzI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 14 May 2023 20:55:08 -0400
X-Greylist: delayed 498 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 14 May 2023 17:55:06 PDT
Received: from mail-out02.belwue.de (mail-out02.belwue.de [IPv6:2001:7c0:0:76::12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E65710DF
        for <linux-clk@vger.kernel.org>; Sun, 14 May 2023 17:55:06 -0700 (PDT)
Received: from mail-hub01.belwue.de (mail-hub01.belwue.de [129.143.76.41])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by mail-out02.belwue.de (Postfix) with ESMTPS id 4QKLKb2n0kzB111F;
        Mon, 15 May 2023 02:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dhbw-ravensburg.de;
        s=DKIM001; t=1684111606; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
        bh=RNaOgrSy70wp7WTLmZJTA9WP9+nLRpFE39oHhVNwQlE=;
        b=EHhFxeczZRSGSgE1oRDuqppaP3MXN+w5Ljc9E3CVTf6uGkQ+e9KCA5WPwIOC01xEg7qO4k
        cZ8pS0UDcuLKdnqEuGtqbFPKBYoHeuAdYY/kHJyXgH6H1Ae9ezHwcMZ7JWMameBgovdv9U
        2hqX6wRw9p2hMWLDeVpA+/f/fqY3KcpCJEhYrt/EJfimWmdyXEp5Zbn+dYuLR7D0127Xwr
        w59y98TbWGdNGSv2cxmFVyAGepSIpwbC+IT3woSfL7D32nkNWDTC6lr3VZjd2JDKkT65Um
        PAesILRiEf/g7fQvfRXSLMqWgRqSr7WIPUiutNm7qN6p/MXY8MJa5Ijsqtsy3w==
Received: from exhubcas01.dhbw-ravensburg.de (unknown [141.68.130.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by mail-hub01.belwue.de (Postfix) with ESMTPS id 4QKL826px4z52B5s;
        Mon, 15 May 2023 02:38:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dhbw-ravensburg.de;
        s=DKIM001; t=1684111603; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
        bh=RNaOgrSy70wp7WTLmZJTA9WP9+nLRpFE39oHhVNwQlE=;
        b=UxSlamTOjobTIg+DS/KRhV87y0ZoZm0JliuedWCjHWQvncDaEM8g++85v9J3EBxBJ68aDr
        81JCv5bHQaAVTy82GgpIVVCzK3GVS4Q0wG/EbrpKHXnhp5QFE8Vml662Csb9mllU7Lksvl
        1TT47NCtp1hdoqFHNpwSVDAIWHWN6SyyIEYZ3BvP6VA8rIKKXIKu67XveJuhx5mN0jeyl/
        1CG+WGQrZZJA9arK6ioZipNB2WxEMZTJu9wNc9eFzqLdc6Mpz+HD/giDaiAJofFi8sntYw
        f/9e7ffM4HF0GJs/3n20QbBBaSf+rmMhWaxGFC3qKSAQriRBepqliRUgNnqVUg==
Received: from EXHUBCAS02.msx-dhbw-rv.intra (141.68.130.12) by
 exhubcas01.msx-dhbw-rv.intra (141.68.130.11) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 15 May 2023 02:20:00 +0200
Received: from EXMAIL02.msx-dhbw-rv.intra ([141.68.130.22]) by exhubcas02
 ([141.68.130.12]) with mapi id 14.03.0513.000; Mon, 15 May 2023 02:19:57
 +0200
From:   "Bergmann, Michaela - DHBW-Ravensburg" <bergmann@dhbw-ravensburg.de>
Subject: Aw: Das META-Unternehmen Zuschuss 
Thread-Topic: Aw: Das META-Unternehmen Zuschuss 
Thread-Index: AdmGv8PQj5pSwbbXQbCGUnnW8YF04QAAp27QAAAAFgAAAAAawA==
Date:   Mon, 15 May 2023 00:19:55 +0000
Message-ID: <9B98CDA3A8E98B478103857425C9C0FD042A444155@exmail02>
Reply-To: "contact@mtagroup.info" <contact@mtagroup.info>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [141.68.120.240]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To:     Undisclosed recipients:;
X-Rspamd-UID: 335762
X-Rspamd-Queue-Id: 4QKLKb2n0kzB111F
X-Rspamd-UID: 2a4c58
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FILL_THIS_FORM,LOTS_OF_MONEY,
        MONEY_FORM,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_FILL_THIS_FORM_LOAN,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


META Unternehmen
Facebook, Instagram und WhatsApp
1601 WILLOW ROAD MENLO PARK, CA 94025
www. facebook. com

Dem Unternehmen META geh=F6ren neben anderen Produkten und Dienstleistungen=
 auch Facebook, Instagram und WhatsApp. Meta ist eines der wertvollsten Unt=
ernehmen der Welt.

META (die Muttergesellschaft von Facebook, Instagram und WhatsApp) vergibt =
einen Zuschuss in H=F6he von $920.000,00USD an 10 gl=FCckliche Kunden aus a=
llen L=E4ndern der Welt. Wir gratulieren Ihnen, dass Sie einer der zehn Gl=
=FCcklichen sind, die diesen Zuschuss von $920.000,00USD erhalten.

Kontaktieren Sie uns per E-Mail: contact@mtagroup.info mit den folgenden In=
formationen, um Ihren Zuschuss zu bearbeiten.
=A0
Vollst=E4ndige Namen .............
Telefonnummer ........
Adresse .............
Land ................
Geschlecht .................
Alter ....................
Beruf .............
=A0
Die Firma META sch=E4tzt Ihr Recht auf Privatsph=E4re! Ihre Daten sind zu 1=
00 % sicher und werden ausschlie=DFlich f=FCr den Zweck dieses Zuschusses v=
erwendet.

Es gelten die allgemeinen Gesch=E4ftsbedingungen.



B=FCro des Pr=E4sidenten von
Facebook-CEO
Herr Mark Zuckerberg
